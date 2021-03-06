<?php

namespace App\Http\Controllers;
use File;
use App\User;
use Illuminate\Support\Facades\Log;
use Intervention\Image\Facades\Image;
use App\Property;
use App\Photo;
use App\Reservation;
use App\Location;
use Illuminate\Support\Facades\Storage;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Auth;
class PropertyController extends Controller
{
    public function create(Request $request){
        $folder = Str::random(10);
        $property = new Property();
        $property->user_id = $request->user_id;
        $property->title = $request->title;
        $property->price = $request->price;
        $property->description = $request->description;
        $property->filename = $folder;
        if(!Location::where('name', $request->location)->first()){
            $location = new Location();
            $location->name=$request->location;
            $location->save();
        }
        $location = Location::where('name', $request->location)->first();
        $property->location_id = $location->id;
        $path = public_path('images/').($folder).('/');
        File::makeDirectory(public_path('images/').($folder));
        if(isset($request->cover)){
            $covername = Str::random(4).time().'.' .
            explode('/', explode(':', substr($request->cover, 0, strpos($request->cover, ';')))[1])[1];
            Image::make($request->cover)->save($path.$covername);
            $property->cover = $covername;
            $cover = new Photo();
            $cover->name=$covername;
            $cover->folder=$folder;
            $cover->save();
        }
        $property->save();
        if (count($request->photos) > 0){
            foreach ($request->photos as $photo) {
                $name = Str::random(4).time().'.' . explode('/', explode(':', substr($photo, 0, strpos($photo, ';')))[1])[1];
                Image::make($photo)->save($path.$name);
                $image = new Photo();
                $image->name=$name;
                $image->folder=$folder;
                $image->save();
            }   
        }
    return response()->json(['status' => 'success'], 200);
    }

    public function index()
    {
        $properties = Property::all();
        
        $data = (array)[];
        foreach ($properties as $prop) {
        if(isset($prop->cover)){
            $cover=('images/').($prop->filename).'/'.($prop->cover);
        }
        else{
            $cover=null;
        }
        $pr = (object)[
            "id" => $prop->id,
            "title" => $prop->title,
            "price" => $prop->price,
            "cover" => $cover,
            "location" => $prop->location->name
        ];
        $data[]= $pr;
        };
        $data = json_encode($data);
        return response($data, Response::HTTP_OK);
    }

    public function propertiesOfUser()
    {
        $user = Auth::user();
        $properties = Property::where('user_id', $user->id)->get();
        
        $data = (array)[];
        foreach ($properties as $prop) {
        if(isset($prop->cover)){
            $cover=('images/').($prop->filename).'/'.($prop->cover);
        }
        else{
            $cover=null;
        }
        $pr = (object)[
            "id" => $prop->id,
            "title" => $prop->title,
            "price" => $prop->price,
            "cover" => $cover,
            "location" => $prop->location->name
        ];
        $data[]= $pr;
        };
        $data = json_encode($data);
        return response($data, Response::HTTP_OK);
    }

    public function show(Request $request, $id)
    {
        $prop = Property::find($id);
        $location = $prop->location;
        $images = Photo::where('folder', $prop->filename)
               ->get();
        $reservations = Reservation::where('property_id', $id)
               ->get();
        $username = $prop->user->username;
        return response([$prop, $images, $reservations], Response::HTTP_OK);
    }

    public function update(Request $request, $id){
        Property::find( $id )->update( 
            ['title' => $request->title,
            'price' => $request->price,
            'description' => $request->description]
        );
        return response()->json(
            [ 
               'status' => 'success',
               'message' => 'Property updated successfully'
            ], 200);
    }

    public function destroy( $id ) {

        $prop = Property::find( $id );
        $images = Photo::where('folder', $prop->filename)
            ->get();
        $reservations = Reservation::where('property_id', $prop->id)
        ->get();
        foreach ($images as $image) {
        $image->delete();
        }
        foreach ($reservations as $res) {
            $res->delete();
            }
        File::deleteDirectory(public_path('images/').($prop->filename));
        $prop->delete();
        return response()->json(
            [ 
               'status' => 'success',
               'message' => 'Property deleted successfully'
            ], 200);
	}
}

<?php

namespace App\Http\Controllers;
use File;
use App\User;
use Illuminate\Support\Facades\Log;
use Intervention\Image\Facades\Image;
use App\Property;
use Illuminate\Support\Facades\Storage;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Str;
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
        $property->location_id = $request->location_id;
        $path = public_path('app/').($folder).('/');
        Storage::makeDirectory($folder);
        if(isset($request->cover)){
            $covername = Str::random(4).time().'.' . explode('/', explode(':', substr($request->cover, 0, strpos($request->cover, ';')))[1])[1];
            Image::make($request->cover)->save($path.$covername);
            $property->cover = $covername;
        }
        $property->save();
        if (count($request->photos) > 0){
            foreach ($request->photos as $photo) {
                $name = Str::random(4).time().'.' . explode('/', explode(':', substr($photo, 0, strpos($photo, ';')))[1])[1];
                Image::make($photo)->save($path.$name);
            }   
        }
    return response()->json(['status' => 'success'], 200);
    }

    public function index()
    {
        $properties = Property::all();
        $data = (array)[];
        foreach ($properties as $prop) {
        $pr = (object)[
            "title" => $prop->title,
            "price" => $prop->price,
            "cover" => ('images/').($prop->filename).'/'.($prop->cover)
        ];
        $data[]= $pr;
        };
        $data = json_encode($data);
        return response($data, Response::HTTP_OK);
    }

}

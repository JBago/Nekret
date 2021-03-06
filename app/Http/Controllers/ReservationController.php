<?php

namespace App\Http\Controllers;
use App\Reservation;
use Illuminate\Http\Request;

class ReservationController extends Controller
{
    public function create(Request $request){
        $reservation = new Reservation();
        $reservation->property_id = $request->property_id;
        $reservation->date = $request->date;
        $reservation->save();
    return response()->json(['status' => 'success'], 200);
    }

    public function delete( $id ) {
		Reservation::find( $id )->delete();

		return response()->json(
            [ 
                'status' => 'success',
                'message' => 'Reservation deleted successfully'
            ], 200);
	}
}

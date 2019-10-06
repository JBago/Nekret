<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Reservation extends Model
{
    protected $fillable = ['date', 'property_id'];

    public function user()
    {
        return $this->belongsTo('App\Property');
    }

    public $timestamps = false;
}

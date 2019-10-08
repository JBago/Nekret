<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Property extends Model
{
    protected $table = 'properties';

    protected $fillable = ['user_id', 'title','price','description', 'filename', 'location_id', 'cover'];

    public function user()
    {
        return $this->belongsTo('App\User');
    }
    public function location()
    {
        return $this->belongsTo('App\Location');
    }

    public function reservation()
    {
        return $this->hasMany('App\Reservation');
    }

    public $timestamps = false;
}

<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Property extends Model
{
    protected $table = 'properties';

    protected $fillable = ['user_id', 'title','price','description', 'filename', 'location_id', 'cover'];

    public $timestamps = false;
}

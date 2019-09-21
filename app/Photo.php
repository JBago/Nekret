<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Photo extends Model
{

    protected $fillable = ['name', 'folder'];

    public $timestamps = false;
}

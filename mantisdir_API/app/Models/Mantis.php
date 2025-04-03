<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Mantis extends Model
{
    protected $table = 'continental_species';
    protected $primaryKey = 'continental_id';
    public function subspecies()
    {
        return $this->hasMany(Subspecies::class, 'continental_id', 'continental_id');
    }
}

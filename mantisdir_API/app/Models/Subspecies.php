<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Subspecies extends Model
{
    protected $table = 'subspecies';
    protected $primaryKey = 'subspecies_id';

    public function continentalSpecies()
    {
        return $this->belongsTo(Mantis::class, 'continental_id', 'continental_id');
    }
}
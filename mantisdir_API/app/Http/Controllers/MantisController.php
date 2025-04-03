<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB; 

use App\Models\Mantis;
use App\Models\Subspecies;


class MantisController extends Controller
{
    public function getAll()
    {
        $mantises = Mantis::with('subspecies')->get();
        return response()->json($mantises);
    }

    public function getById($id)
    {
        $mantises = Mantis::with('subspecies')->findOrFail($id);
        return response()->json($mantises);
    }

    public function getSubspeciesById($id)
    {
        $subspecies = Subspecies::findOrFail($id);
        return response()->json($subspecies);
    }
}
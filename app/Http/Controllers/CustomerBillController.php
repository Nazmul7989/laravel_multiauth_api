<?php

namespace App\Http\Controllers;

use App\Models\Bill;
use Illuminate\Http\Request;

class CustomerBillController extends Controller
{
    public function index($id)
    {
        $bills = Bill::where('user_id',$id)->get();

        return response()->json([
            'status' => true,
            'bills'  => $bills,
        ],200);
    }
}

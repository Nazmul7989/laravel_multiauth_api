<?php

namespace App\Http\Controllers;

use App\Models\Bill;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Cache;

class BillController extends Controller
{

    public function index()
    {
        $bills = Bill::with('user:id,name')->get();
        return response()->json([
            'status' => true,
            'bills'  => $bills,
        ],200);
    }


    public function store(Request $request)
    {
        $request->validate([

            'user_id'       => 'required',
            'date'          => 'required',
            'amount'        => 'required',
        ]);

        $bill = new Bill();

        $bill->user_id   = $request->user_id;
        $bill->date      = $request->date;
        $bill->amount    = $request->amount;
        $bill->save();


        return response()->json([
            'status' => true,
            'message'  => 'Bill created successfully.',
        ],200);

    }


    public function update(Request $request, $id)
    {
        $bill = Bill::findOrFail($id);

        $request->validate([

            'user_id'       => 'required',
            'date'          => 'required',
            'amount'        => 'required',
        ]);


        $bill->user_id   = $request->user_id;
        $bill->date      = $request->date;
        $bill->amount    = $request->amount;
        $bill->save();

        return response()->json([
            'status' => true,
            'message'  => 'Bill Updated successfully.',
        ],200);

    }


    public function destroy($id)
    {
        $bill = Bill::findOrFail($id);
        $bill->delete();

        return response()->json([
            'status' => true,
            'message'  => 'Bill Deleted successfully.',
        ],200);

    }

    public function updateStatus($id)
    {
        $bill = Bill::findOrFail($id);

        if ($bill->status == 1) {
            $bill->status = 0;
            $bill->save();
        }else{
            $bill->status = 1;
            $bill->save();
        }

        return response()->json([
            'status' => true,
            'message'  => 'Bill Status Changed successfully.',
        ],200);

    }


}

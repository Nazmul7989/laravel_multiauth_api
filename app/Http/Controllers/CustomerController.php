<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class CustomerController extends Controller
{

    public function index()
    {
        $customers = User::all();
        return response()->json([
            'status' => true,
            'customers'  => $customers,
        ],200);
    }


    public function store(Request $request)
    {
        $request->validate([

            'name'        => 'required',
            'email'       => 'required|email|unique:users,email',
            'password'    => 'required',
        ]);

        $customer = new User();

        $customer->name     = $request->name;
        $customer->email    = $request->email;
        $customer->password = Hash::make($request->password);
        $customer->address  = $request->address;
        $customer->save();

        return response()->json([
            'status' => true,
            'message'  => 'Customer created successfully.',
        ],200);

    }


    public function update(Request $request, $id)
    {
        $customer = User::findOrFail($id);

        $request->validate([

            'name'        => 'required',
            'email'       => 'required|email|unique:users,email,'.$customer->id,
            'password'    => 'sometimes|nullable',
        ]);



        $customer->name     = $request->name;
        $customer->email    = $request->email;
        $customer->password = Hash::make($request->password);
        $customer->address  = $request->address;
        $customer->save();

        return response()->json([
            'status' => true,
            'message'  => 'Customer Updated successfully.',
        ],200);

    }


    public function destroy($id)
    {
        $customer = User::findOrFail($id);
        $customer->delete();

        return response()->json([
            'status' => true,
            'message'  => 'Customer Deleted successfully.',
        ],200);

    }
}

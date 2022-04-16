<?php

namespace App\Http\Controllers;

use App\Models\Admin;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Validator;

class AuthController extends Controller
{
    //customer dashboard
    public function userDashboard($id)
    {
        $user = User::select('users.*')->find($id);

        return response()->json([
            'status' => true,
            'customer'  => $user,
        ],200);
    }

    //admin dashboard
    public function adminDashboard($id)
    {
        $admin = Admin::select('admins.*')->find($id);

        return response()->json([
            'status' => true,
            'admin'  => $admin,
        ],200);
    }

    //customer login
    public function userLogin(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'email' => 'required|email',
            'password' => 'required',
        ]);

        if($validator->fails()){
            return response()->json([
                'status' => false,
                'error' => $validator->errors()
            ]);
        }

        if(auth()->guard('customer')->attempt(['email' => request('email'), 'password' => request('password')])){

            config(['auth.guards.api.provider' => 'customer']);

            $user = User::select('users.*')->find(auth()->guard('customer')->user()->id);

            $token = $user->createToken('Personal Access Token')->accessToken;
            $token_expires = Carbon::now()->addWeek(1);


            return response()->json([

                'customer' => $user,
                'access_token' => $token,
                'token_type' => "Bearer",
                'token_expires' => Carbon::parse($token_expires)->toDateString()
            ],200);

        }else{
            return response()->json(['error' => ['Email and Password are Wrong.']], 200);
        }
    }

    //admin login
    public function adminLogin(Request $request)
    {

        $validator = Validator::make($request->all(), [
            'email' => 'required|email',
            'password' => 'required',
        ]);

        if($validator->fails()){
            return response()->json([
                'status' => false,
                'error' => $validator->errors()
            ]);
        }

        if(auth()->guard('admin')->attempt(['email' => request('email'), 'password' => request('password')])){

            config(['auth.guards.api.provider' => 'admin']);

            $admin = Admin::select('admins.*')->find(auth()->guard('admin')->user()->id);

            $token = $admin->createToken('Personal Access Token')->accessToken;
            $token_expires = Carbon::now()->addWeek(1);


            return response()->json([

                'admin' => $admin,
                'access_token' => $token,
                'token_type' => "Bearer",
                'token_expires' => Carbon::parse($token_expires)->toDateString()
            ],200);

        }else{
            return response()->json(['error' => ['Email and Password are Wrong.']], 200);
        }
    }

}

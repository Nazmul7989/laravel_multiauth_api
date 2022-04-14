<?php

namespace App\Http\Controllers;

use App\Models\Admin;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Validator;

class AuthController extends Controller
{
    //user dashboard
    public function userDashboard()
    {
        $user = User::select('users.*')->find(auth()->guard('user')->user()->id);

        return response()->json([
            'status' => true,
            'user'  => $user,
        ],200);
    }

    //admin dashboard
    public function adminDashboard()
    {
        $admin = Admin::select('admins.*')->find(auth()->guard('admin')->user()->id);

        return response()->json([
            'status' => true,
            'user'  => $admin,
        ],200);
    }

    //user login
    public function userLogin(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'email' => 'required|email',
            'password' => 'required',
        ]);

        if($validator->fails()){
            return response()->json([
                'status' => false,
                'error' => $validator->errors()->all()
            ]);
        }

        if(auth()->guard('user')->attempt(['email' => request('email'), 'password' => request('password')])){

            config(['auth.guards.api.provider' => 'user']);

            $user = User::select('users.*')->find(auth()->guard('user')->user()->id);

            $token = $user->createToken('Personal Access Token')->accessToken;
            $token_expires = Carbon::now()->addWeek(1);


            return response()->json([

                'user' => $user,
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
                'error' => $validator->errors()->all()
            ]);
        }

        if(auth()->guard('admin')->attempt(['email' => request('email'), 'password' => request('password')])){

            config(['auth.guards.api.provider' => 'admin']);

            $admin = Admin::select('admins.*')->find(auth()->guard('admin')->user()->id);

            $token = $admin->createToken('Personal Access Token')->accessToken;
            $token_expires = Carbon::now()->addWeek(1);


            return response()->json([

                'user' => $admin,
                'access_token' => $token,
                'token_type' => "Bearer",
                'token_expires' => Carbon::parse($token_expires)->toDateString()
            ],200);

        }else{
            return response()->json(['error' => ['Email and Password are Wrong.']], 200);
        }
    }

}

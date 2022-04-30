# laravel_multiauth_api

##  To run this project, please follow the instructions bellow:

## 1. Dependency
- This project requres PHP version 8
- Install redis to your local machine


## 2. Configure .env file to connect database.
```
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=laravel_multiauth_api
DB_USERNAME=root
DB_PASSWORD=

```

## 3. Configure .env file for queue connection.
```
BROADCAST_DRIVER=log
CACHE_DRIVER=redis
FILESYSTEM_DISK=local
QUEUE_CONNECTION=redis
SESSION_DRIVER=file
SESSION_LIFETIME=120
```

## 4. Configure .env file for mail send.
```
MAIL_MAILER=smtp
MAIL_HOST=smtp.mailtrap.io
MAIL_PORT=2525
MAIL_USERNAME=
MAIL_PASSWORD=
MAIL_ENCRYPTION=tls
MAIL_FROM_ADDRESS="kinetik@gmail.com"
MAIL_FROM_NAME="${APP_NAME}"
```

## 5.  Install Passport
```
composer require laravel/passport
```
```
php artisan migrate
```
```
php artisan passport:install
```


## 6.  Create Admin Table
```
php artisan make:model Admin -m
```
### database/migrations/2020_10_30_064135_create_admins_table.php
```
<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('admins', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->string('email')->unique();
            $table->timestamp('email_verified_at')->nullable();
            $table->string('password');
            $table->string('address')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('admins');
    }
};

```

```
php artisan migrate
```

## 7. Passport Configuration
### app/Models/User.php
```
<?php

namespace App\Models;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Passport\HasApiTokens;

class User extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'name',
        'email',
        'password',
    ];



    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];



}

```

### app/Models/User.php
```
<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Passport\HasApiTokens;

class Admin extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable;

    protected $fillable = ['name','email','password','email_verified_at','address'];

    protected $hidden = [
        'password',
        'remember_token',
    ];



}

```

## 8. Add Passport in AuthServiceProvider
### app/Providers/AuthServiceProvider.php
```
<?php

namespace App\Providers;

use Illuminate\Foundation\Support\Providers\AuthServiceProvider as ServiceProvider;
use Illuminate\Support\Facades\Gate;
use Laravel\Passport\Passport;

class AuthServiceProvider extends ServiceProvider
{
    /**
     * The policy mappings for the application.
     *
     * @var array<class-string, class-string>
     */
    protected $policies = [
         //'App\Models\Model' => 'App\Policies\ModelPolicy',
    ];

    /**
     * Register any authentication / authorization services.
     *
     * @return void
     */
    public function boot()
    {
        $this->registerPolicies();

        Passport::routes();

        Passport::tokensCan([
            'customer' => 'User Type',
            'admin' => 'Admin User Type',
        ]);
    }
}

```
## 10. Create Auth Guard
### config/auth.php
```
<?php

return [

    /*
    |--------------------------------------------------------------------------
    | Authentication Defaults
    |--------------------------------------------------------------------------
    |
    | This option controls the default authentication "guard" and password
    | reset options for your application. You may change these defaults
    | as required, but they're a perfect start for most applications.
    |
    */

    'defaults' => [
        'guard' => 'web',
        'passwords' => 'users',
    ],

    /*
    |--------------------------------------------------------------------------
    | Authentication Guards
    |--------------------------------------------------------------------------
    |
    | Next, you may define every authentication guard for your application.
    | Of course, a great default configuration has been defined for you
    | here which uses session storage and the Eloquent customer provider.
    |
    | All authentication drivers have a customer provider. This defines how the
    | users are actually retrieved out of your database or other storage
    | mechanisms used by this application to persist your customer's data.
    |
    | Supported: "session"
    |
    */

    'guards' => [
        'customer' => [
            'driver' => 'session',
            'provider' => 'users',
        ],

        'customer-api' => [
            'driver' => 'passport',
            'provider' => 'users',
        ],

        'admin' => [
            'driver' => 'session',
            'provider' => 'admins',
        ],

        'admin-api' => [
            'driver' => 'passport',
            'provider' => 'admins',
        ],
        'web' => [
            'driver' => 'session',
            'provider' => 'users',
        ],
    ],


    /*
    |--------------------------------------------------------------------------
    | User Providers
    |--------------------------------------------------------------------------
    |
    | All authentication drivers have a customer provider. This defines how the
    | users are actually retrieved out of your database or other storage
    | mechanisms used by this application to persist your customer's data.
    |
    | If you have multiple customer tables or models you may configure multiple
    | sources which represent each model / table. These sources may then
    | be assigned to any extra authentication guards you have defined.
    |
    | Supported: "database", "eloquent"
    |
    */

    'providers' => [
        'users' => [
            'driver' => 'eloquent',
            'model' => App\Models\User::class,
        ],

         'admins' => [
             'driver' => 'eloquent',
             'model' => App\Models\Admin::class,
         ],
    ],

    /*
    |--------------------------------------------------------------------------
    | Resetting Passwords
    |--------------------------------------------------------------------------
    |
    | You may specify multiple password reset configurations if you have more
    | than one customer table or model in the application and you want to have
    | separate password reset settings based on the specific customer types.
    |
    | The expire time is the number of minutes that each reset token will be
    | considered valid. This security feature keeps tokens short-lived so
    | they have less time to be guessed. You may change this as needed.
    |
    */

    'passwords' => [
        'users' => [
            'provider' => 'users',
            'table' => 'password_resets',
            'expire' => 60,
            'throttle' => 60,
        ],
    ],

    /*
    |--------------------------------------------------------------------------
    | Password Confirmation Timeout
    |--------------------------------------------------------------------------
    |
    | Here you may define the amount of seconds before a password confirmation
    | times out and the customer is prompted to re-enter their password via the
    | confirmation screen. By default, the timeout lasts for three hours.
    |
    */

    'password_timeout' => 10800,

];

```
## 11.  Add Scope Middleware
### app/Http/Kernel.php
```
 protected $routeMiddleware = [
        'scopes' => \Laravel\Passport\Http\Middleware\CheckScopes::class,
        'scope' => \Laravel\Passport\Http\Middleware\CheckForAnyScope::class,
    ];
```

## 12.   Create Custom route File
### Now you will create custom route file like admin.php and user.php etc.. let's create api folder in route directory and create two bellow file in api folder.

1)admin.php

2)user.php

### routes/api/admin.php
```
<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;


Route::post('/admin/login',[AuthController::class, 'adminLogin'])->name('adminLogin');

Route::group( ['prefix' => 'admin','middleware' => ['auth:admin-api'] ],function(){
    // authenticated staff routes here
    Route::get('/dashboard/{id}',[AuthController::class, 'adminDashboard']);
});

```

### routes/api/user.php
```
<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;


Route::post('/customer/login',[AuthController::class, 'userLogin'])->name('userLogin');

Route::group( ['prefix' => 'customer','middleware' => ['auth:customer-api'] ],function(){
    // authenticated staff routes here
    Route::get('/dashboard/{id}',[AuthController::class, 'userDashboard']);
});


```

## 13. Register Routes File In RouteServiceProvider
```
 public function boot()
    {
        $this->configureRateLimiting();

        $this->routes(function () {
            Route::prefix('api')
                ->middleware('api')
                ->namespace($this->namespace)
                ->group(base_path('routes/api/admin.php'));

            Route::prefix('api')
                ->middleware('api')
                ->namespace($this->namespace)
                ->group(base_path('routes/api/customer.php'));


            Route::middleware('web')
                ->group(base_path('routes/web.php'));
        });
    }
```
## 14. Create Controller AuthController
```
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

```



## 9. Run server.
```
php artisan serve
```
## 10. Run Queue for Mail Sending.
```
php artisan queue:work
```

# When you call authenticated api, please include the following code with header
```
'headers' => [

    'Accept' => 'application/json',

    'Authorization' => 'Bearer '.$accessToken,

]
```

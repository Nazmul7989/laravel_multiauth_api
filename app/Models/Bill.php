<?php

namespace App\Models;

use App\Events\BillCreated;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Bill extends Model
{
    use HasFactory;

    protected $fillable = ['user_id','date','amount','status'];

    protected $table = 'bills';

    public function user()
    {
        return $this->belongsTo(User::class,'user_id','id');
    }

    protected $dispatchesEvents = [
        'created' => BillCreated::class,

    ];

}

<?php

namespace App\Listeners;

use App\Models\Bill;
use App\Models\User;
use App\Notifications\SendBillCreatedNotification;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Queue\InteractsWithQueue;


class BillCreatedNotificationSenderListener
{
    /**
     * Create the event listener.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    /**
     * Handle the event.
     *
     * @param  object  $event
     * @return void
     */
    public function handle($event)
    {
        $user_id = Bill::latest()->first()->user_id;
        $user = User::where('id',$user_id)->first();
        $user->notify(new SendBillCreatedNotification($user));
    }
}

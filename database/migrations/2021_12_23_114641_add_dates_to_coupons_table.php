<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddDatesToCouponsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('coupons', function (Blueprint $table) {
            $table->string('message_before_started_at')->after('status')->nullable();
            $table->string('message_after_expired_at')->after('message_before_started_at')->nullable();
            $table->renameColumn('coupon_validity', 'started_at');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('coupons', function (Blueprint $table) {
            $table->dropColumn('message_before_started_at');
            $table->dropColumn('message_after_expired_at');
            $table->renameColumn('started_at', 'coupon_validity');
        });
    }
}

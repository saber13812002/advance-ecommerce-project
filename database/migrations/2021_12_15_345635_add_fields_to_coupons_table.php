<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddFieldsToCouponsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('coupons', function (Blueprint $table) {
            $table->string('model_name')->after('coupon_validity')->nullable();
            $table->string('model_id')->after('model_name')->nullable();
            $table->enum('coupon_discount_type', ['Percent', 'Toman', 'Dollar'])->after('model_id')->default("Percent")->nullable();
            $table->dateTime('expired_at')->nullable();
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
            $table->dropColumn('model_name');
            $table->dropColumn('model_id');
            $table->dropColumn('coupon_discount_type');
            $table->dropColumn('expired_at');
        });
    }
}

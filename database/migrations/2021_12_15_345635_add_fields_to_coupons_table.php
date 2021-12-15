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
            $table->string('model_type')->after('coupon_validity')->nullable();
            $table->string('model_name')->after('model_type')->nullable();
            $table->enum('coupon_discount_type', ['Percent', 'Toman', 'Dollar'])->default("Percent")->nullable();
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
            $table->dropColumn('model_type');
            $table->dropColumn('model_name');
            $table->dropColumn('coupon_discount_type');
            $table->dropColumn('expired_at');
        });
    }
}

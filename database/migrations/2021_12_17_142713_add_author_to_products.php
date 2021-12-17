<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddAuthorToProducts extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('products', function (Blueprint $table) {
            $table->string('owner_name')->after('status')->nullable();
            $table->string('owner_model_name')->after('owner_name')->nullable();
            $table->string('owner_model_id')->after('owner_model_name')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('products', function (Blueprint $table) {
            $table->dropColumn('owner_name');
            $table->dropColumn('owner_model_name');
            $table->dropColumn('owner_model_id');
        });
    }
}

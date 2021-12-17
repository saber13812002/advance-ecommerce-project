<?php

namespace App\Http\Middleware;

use Illuminate\Auth\Middleware\Authenticate as Middleware;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Str;

class Authenticate extends Middleware
{
    /**
     * Get the path the user should be redirected to when they are not authenticated.
     *
     * @param \Illuminate\Http\Request $request
     * @return string|null
     */
    protected function redirectTo($request)
    {
        if (!$request->expectsJson()) {
            $relatedPath = str_replace(url('/'), '', url()->previous());
            $collectionPath = Str::of($relatedPath)->split('/[\s\/]+/');

            if ($collectionPath[1]) {
                if ($collectionPath[1] == "admin" || $collectionPath[1] == "dashboard") {
                    route('admin.login.page');
                }
            }
        }
        return route('login');
    }

}

<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;

class BlockOnProduction
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle(Request $request, Closure $next)
    {
        $env = config('app.env', 'production');
        $validEnv = ['local', 'debug', 'development'];
        if (in_array($env, $validEnv, true)) {
            return $next($request);
        }
        abort(403, 'Access denied');
    }
}

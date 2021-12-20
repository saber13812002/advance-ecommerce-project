<?php

namespace App\Exceptions;

use Illuminate\Http\JsonResponse;
use Illuminate\Http\Response;
use Exception;

class ClientException extends Exception
{
    protected $message;
    protected $code;

    public function __construct(
        string $message,
        int $code = Response::HTTP_UNPROCESSABLE_ENTITY
    ) {
        parent::__construct($message, $code);

        $this->message = $message;
        $this->code = $code;
    }

    public function render(): JsonResponse
    {
        return apiResponse()->errors($this->getMessage())->status($this->getCode())->get();
    }
}

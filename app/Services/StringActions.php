<?php


namespace App\Services;


class StringActions
{

    /**
     * Get the path the user should be redirected to when they are not authenticated.
     *
     * @param array $collectionPath
     * @param string $phrase
     * @return bool
     */
    public static function searchUrl(array $collectionPath, string $phrase): bool
    {
        foreach ($collectionPath as $paths) {
            if ($paths == $phrase) {
                return true;
            }
        }
        return false;
    }
}

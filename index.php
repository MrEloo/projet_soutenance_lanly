<?php

session_start();
// charge l'autoload de composer
require "vendor/autoload.php";

// charge le contenu du .env dans $_ENV
$dotenv = Dotenv\Dotenv::createImmutable(__DIR__);
$dotenv->load();

$newTokenManger = new CSRFTokenManager();

if (!isset($_SESSION['csrf_token'])) {
    $_SESSION['csrf_token'] = $newTokenManger->generateCSRFToken();
}

if (!isset($_SESSION['user_lang'])) {
    $_SESSION['user_lang'] = 'fr';
}


$router = new Router();

$router->handleRequest($_GET);

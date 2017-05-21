<?php

session_start();

if ($_SERVER['REQUEST_METHOD'] != 'POST' || !isset($_SESSION['user_id'])) {
    header('Location: ' . $_SERVER['HTTP_REFERER']);
    die();
}

session_unset();

session_destroy();

header("Location: /");
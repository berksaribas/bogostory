<?php

if ($_SERVER['REQUEST_METHOD'] != 'POST' || !isset($_SESSION['user_id'])) {
    header('Location: ' . $_SERVER['HTTP_REFERER']);
}

include "connector.php";

session_start();

$uid = $_SESSION['user_id'];
$pid = $_POST['pid'];
$positive = $_POST['positive'];

$records = $db->prepare('INSERT INTO path_votes (uid, pid, positive) VALUES (?, ?, ?)');
$records->bind_param('sss', $uid, $pid, $positive);
$records->execute();

header('Location: ' . $_SERVER['HTTP_REFERER']);
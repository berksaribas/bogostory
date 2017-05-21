<?php

if ($_SERVER['REQUEST_METHOD'] != 'POST' || !isset($_SESSION['user_id'])) {
    header('Location: ' . $_SERVER['HTTP_REFERER']);
}

include "connector.php";

session_start();

$uid = $_SESSION['user_id'];
$sid = $_POST['sid'];
$positive = $_POST['positive'];

$records = $db->prepare('INSERT INTO story_votes (uid, sid, positive) VALUES (?, ?, ?)');
$records->bind_param('sss', $uid, $sid, $positive);
$records->execute();

header('Location: ' . $_SERVER['HTTP_REFERER']);
<?php

session_start();

if ($_SERVER['REQUEST_METHOD'] != 'POST' || !isset($_SESSION['user_id'])) {
    header('Location: ' . $_SERVER['HTTP_REFERER']);
    die();
}

include "connector.php";

$uid = $_SESSION['user_id'];
$sid = $_POST['sid'];
$summary = $_POST['summary'];
$content = $_POST['content'];

do {
    $stmt = $db->prepare('INSERT INTO paths (uid, sid, summary, content) VALUES (?, ?, ?, ?)');
    $stmt->bind_param('sss', $uid, $sid, $summary, $content);
    $stmt->execute();
} while(0);

header('Location: ' . $_SERVER['HTTP_REFERER']);
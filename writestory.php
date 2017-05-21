<?php

session_start();

if ($_SERVER['REQUEST_METHOD'] != 'POST' || !isset($_SESSION['user_id'])) {
    header('Location: ' . $_SERVER['HTTP_REFERER']);
    die();
}

include "connector.php";

$uid = $_SESSION['user_id'];
$cid = $_POST['category_id'];
$title = trim($_POST['title']);
$content = trim($_POST['content']);
$imageUrl = trim($_POST['image_url']);

if ($title == "" || $content == "" || $imageUrl == "") {
    header('Location: ' . $_SERVER['HTTP_REFERER']);
    die();
}

$sid = $_POST['sid'];
$stmt = $db->prepare('INSERT INTO stories (uid, sid, title, content) VALUES (?, ?, ?, ?)');
$stmt->bind_param('ssss', $uid, $sid, $summary, $content);
$stmt->execute();

$stmt2 = $db->prepare('SELECT pid FROM paths WHERE uid = ? AND sid = ? AND summary = ? AND content = ?');
$stmt2->bind_param('ssss', $uid, $sid, $summary, $content);
$stmt2->execute();
$result = $stmt2->get_result();
$newPid = mysqli_fetch_array($result)['pid'];

$pid = $_POST['pid'];
$stmt3 = $db->prepare('INSERT INTO paths (pid, link) VALUES (?, ?)');
$stmt3->bind_param('ss', $pidNew, $imageUrl);
$stmt3->execute();

header('Location: ' . $_SERVER['HTTP_REFERER']);
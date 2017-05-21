<?php

session_start();

if ($_SERVER['REQUEST_METHOD'] != 'POST' || !isset($_SESSION['user_id'])) {
    header('Location: ' . $_SERVER['HTTP_REFERER']);
    die();
}

include "connector.php";

$uid = $_SESSION['user_id'];
$summary = trim($_POST['summary']);
$content = trim($_POST['content']);
$imageUrl = trim($_POST['image_url']);

if ($summary == "" || $content == "") {
    header('Location: ' . $_SERVER['HTTP_REFERER']);
    die();
}

if (isset($_POST['sid'])) {
    $sid = $_POST['sid'];
    $stmt = $db->prepare('INSERT INTO paths (uid, sid, summary, content) VALUES (?, ?, ?, ?)');
    $stmt->bind_param('ssss', $uid, $sid, $summary, $content);
    $stmt->execute();

    $stmt2 = $db->prepare('SELECT pid FROM paths WHERE uid = ? AND sid = ? AND summary = ? AND content = ?');
    $stmt2->bind_param('ssss', $uid, $sid, $summary, $content);
    $stmt2->execute();
    $result = $stmt2->get_result();
    $newPid = mysqli_fetch_array($result)['pid'];
}

else if (isset($_POST['pid'])) {
    $pid = $_POST['pid'];
    $stmt = $db->prepare('INSERT INTO paths (uid, parent_pid, summary, content) VALUES (?, ?, ?, ?)');
    $stmt->bind_param('ssss', $uid, $pid, $summary, $content);
    $stmt->execute();

    $stmt2 = $db->prepare('SELECT pid FROM paths WHERE uid = ? AND parent_id = ? AND summary = ? AND content = ?');
    $stmt2->bind_param('ssss', $uid, $pid, $summary, $content);
    $stmt2->execute();
    $result = $stmt2->get_result();
    $newPid = mysqli_fetch_array($result)['pid'];
}

if ($imageUrl != "") {
    $pid = $_POST['pid'];
    $stmt = $db->prepare('INSERT INTO paths (pid, link) VALUES (?, ?)');
    $stmt->bind_param('ss', $pidNew, $imageUrl);
    $stmt->execute();
}

header('Location: ' . $_SERVER['HTTP_REFERER']);
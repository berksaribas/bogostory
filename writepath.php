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

if(isset($_POST['sid'])){
    
    $sid = $_POST['sid'];

    do {
        $stmt = $db->prepare('INSERT INTO paths (uid, sid, summary, content) VALUES (?, ?, ?, ?)');
        $stmt->bind_param('ssss', $uid, $sid, $summary, $content);
        $stmt->execute();
    } while(0);
    
}

else if(isset($_POST['pid'])){

    $pid = $_POST['pid'];

    do {
        $stmt = $db->prepare('INSERT INTO paths (uid, parent_pid, summary, content) VALUES (?, ?, ?, ?)');
        $stmt->bind_param('ssss', $uid, $pid, $summary, $content);
        $stmt->execute();
    } while(0);

}

header('Location: ' . $_SERVER['HTTP_REFERER']);
<?php

session_start();

if ($_SERVER['REQUEST_METHOD'] != 'POST' || !isset($_SESSION['user_id'])) {
    header('Location: ' . $_SERVER['HTTP_REFERER']);
    die();
}

include "connector.php";

$uid = $_SESSION['user_id'];
$pid = $_POST['pid'];
$positive = $_POST['positive'];

do {
    $stmt = $db->prepare('INSERT INTO path_votes (uid, pid, positive) VALUES (?, ?, ?)');
    $stmt->bind_param('sss', $uid, $pid, $positive);

    if ($stmt->execute()) {
        break;
    }

    $stmt2 = $db->prepare('SELECT positive FROM path_votes WHERE uid = ? AND pid = ?');
    $stmt2->bind_param('ss', $uid, $pid);
    $stmt2->execute();

    $positiveCheck = mysqli_fetch_array($stmt2->get_result())['positive'];

    if ($positive == $positiveCheck) {
        $stmt3 = $db->prepare('DELETE FROM path_votes WHERE uid = ? AND pid = ?');
        $stmt3->bind_param('ss', $uid, $pid);
        $stmt3->execute();
        break;
    }

    $stmt4 = $db->prepare('UPDATE path_votes SET positive = ? WHERE uid = ? AND pid = ?');
    $stmt4->bind_param('sss', $positive, $uid, $pid);
    $stmt4->execute();
} while(0);

header('Location: ' . $_SERVER['HTTP_REFERER']);
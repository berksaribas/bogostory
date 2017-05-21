<?php

session_start();

if ($_SERVER['REQUEST_METHOD'] != 'POST' || !isset($_SESSION['user_id'])) {
    header('Location: ' . $_SERVER['HTTP_REFERER']);
    die();
}

include "connector.php";

$uid = $_SESSION['user_id'];
$sid = $_POST['sid'];
$positive = $_POST['positive'];

do {
    $stmt = $db->prepare('INSERT INTO story_votes (uid, sid, positive) VALUES (?, ?, ?)');
    $stmt->bind_param('sss', $uid, $sid, $positive);

    if ($stmt->execute()) {
        break;
    }

    $stmt2 = $db->prepare('SELECT positive FROM story_votes WHERE uid = ? AND sid = ?');
    $stmt2->bind_param('ss', $uid, $sid);
    $stmt2->execute();

    $positiveCheck = mysqli_fetch_array($stmt2->get_result())['positive'];

    if ($positive == $positiveCheck) {
        $stmt3 = $db->prepare('DELETE FROM story_votes WHERE uid = ? AND sid = ?');
        $stmt3->bind_param('ss', $uid, $sid);
        $stmt3->execute();
        break;
    }

    $stmt4 = $db->prepare('UPDATE story_votes SET positive = ? WHERE uid = ? AND sid = ?');
    $stmt4->bind_param('sss', $positive, $uid, $sid);
    $stmt4->execute();
} while(0);

header('Location: ' . $_SERVER['HTTP_REFERER']);
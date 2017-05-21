<?php
include "default.php";
$pid = $_GET['pid'];

$path_sql = $db -> prepare("SELECT p.*, s.name as sname, c.cid, c.name as cname, u.username, i.link, COUNT(v.vid) AS c, SUM(v.positive) AS sum FROM paths p LEFT JOIN votes v ON v.pid=p.pid LEFT JOIN stories s ON s.sid = p.sid LEFT JOIN users u ON u.uid=p.uid LEFT JOIN images i ON i.pid=p.pid LEFT JOIN categories c ON c.cid=s.cid WHERE p.pid = ? GROUP BY v.sid");
$path_sql -> bind_param("s", $pid);
$path_sql -> execute();
$path = $path_sql -> get_result();

$child_paths_sql = $db -> prepare("SELECT p.*, u.username, COUNT(v.vid) AS c, SUM(v.positive) AS sum FROM paths p LEFT JOIN votes v ON p.pid = v.pid LEFT JOIN users u ON u.uid=p.uid WHERE p.parent_pid = ? GROUP BY v.pid ORDER BY sum DESC");
$child_paths_sql -> bind_param("s", $pid);
$child_paths_sql -> execute();
$child_paths = $child_paths_sql -> get_result();

$story_name = NULL;
$story_id = NULL;
$path_summary = NULL;
$path_content = NULL;
$path_vote_count = NULL;
$path_upvote = NULL;
$path_image = NULL;
$category_name = NULL;
$category_id = NULL;
$path_username = NULL;
$path_userid = NULL;

while($row = mysqli_fetch_assoc($path)){
    $story_name = $row['sname'];
    $story_id = $row['sid'];
    $path_content = $row['content'];
    $path_summary = $row['summary'];
    $path_vote_count = $row['sum'];
    $path_upvote = $row['c'];
    $path_image = $row['link'];
    $category_name = $row['cname'];
    $category_id = $row['cid'];
    $path_username = $row['username'];
    $path_userid = $row['uid'];
}

?>

<div class="container">
    <div class="field">
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="index.php">Home</a></li>
          <li class="breadcrumb-item"><a href="category.php?cid=<?= $category_id; ?>"><?= $category_name; ?></a></li>
            <li class="breadcrumb-item"><a href="story.php?sid=<?= $story_id; ?>"><?= $story_name; ?></a></li>
            <li class="breadcrumb-item active"><?= $path_summary; ?></li>
        </ol>
    </div>
    <div class="field">
        <div class="field-title"><?php echo $story_name." -> ".$path_summary; ?><div class="author">A path by <a href="user.php?uid=<?= $path_userid; ?>"><?= $path_username; ?></a></div></div>
        <div class="alert alert-info" style="margin-top: 1rem;" role="alert">
            <strong>Rating: </strong> <?php if($path_upvote== NULL) echo "No one has voted yet."; else echo $path_upvote." with ".$path_vote_count." users voted"."."; ?>
        </div>
        <div class="field-content align-start">
            <img class="story-img" src="<?= $path_image; ?>">
            <?= $path_content; ?>
        </div>
        
    </div>
    <div class="field">
        <div class="field-title">Select a Path to Continue</div>
        <div class="field-content align-start">
            <?php
                while($row = mysqli_fetch_assoc($child_paths)):
                    $username = $row['username'];
                    $summary = $row['summary'];
                    $pid = $row['pid'];
                    $path_upvote = $row['sum'];
            ?>
            <div class="path">
                <div class="username"><strong><?= $summary ?></strong>
                    <div class="author"> written by: <?= $username ?></div
                    </div>
                        </div>
                <div class="upvote"><strong>Rating:</strong> <?= $path_upvote ?></div>
                <a href="path.php?pid=<?= $pid ?>" class="btn btn-primary">Read</a>
            
            <?php
                endwhile;
            ?>
            </div>
        </div>
    </div>
</div>

<?php
include "footer.php";
?>
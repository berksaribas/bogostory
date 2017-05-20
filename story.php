<?php
include "default.php";
$sid = $_GET['sid'];

$story_sql = $db -> prepare("SELECT s.*, c.name as cname, u.username, i.link, COUNT(v.vid) AS c, SUM(v.positive) AS sum FROM stories s LEFT JOIN votes v ON v.sid=s.sid LEFT JOIN users u ON u.uid=s.uid LEFT JOIN images i ON i.sid=s.sid LEFT JOIN categories c ON c.cid=s.cid WHERE s.sid = ? GROUP BY v.sid");
$story_sql -> bind_param("s", $sid);
$story_sql -> execute();
$story = $story_sql -> get_result();

$main_paths_sql = $db -> prepare("SELECT p.*, u.username, COUNT(v.vid) AS c, SUM(v.positive) AS sum FROM paths p LEFT JOIN votes v ON p.pid = v.pid LEFT JOIN users u ON u.uid=p.uid WHERE p.sid = ? AND p.parent_pid IS NULL GROUP BY v.pid ORDER BY sum DESC");
$main_paths_sql -> bind_param("s", $sid);
$main_paths_sql -> execute();
$main_paths = $main_paths_sql -> get_result();

$story_name = NULL;
$story_content = NULL;
$story_vote_count = NULL;
$story_upvote = NULL;
$story_image = NULL;
$category_name = NULL;
$category_id = NULL;
$story_username = NULL;
$story_userid = NULL;

while($row = mysqli_fetch_assoc($story)){
    $story_name = $row['name'];
    $story_content = $row['content'];
    $story_upvote = $row['sum'];
    $story_vote_count = $row['c'];
    $story_image = $row['link'];
    $category_name = $row['cname'];
    $category_id = $row['cid'];
    $story_username = $row['username'];
    $story_userid = $row['uid'];
}

?>

<div class="container">
    <div class="field">
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="index.php">Home</a></li>
          <li class="breadcrumb-item"><a href="category.php?cid=<?php echo $category_id; ?>"><?php echo $category_name; ?></a></li>
          <li class="breadcrumb-item active"><?php echo $story_name; ?></li>
        </ol>
    </div>
    <div class="field">
        <div class="field-title"><?php echo $story_name; ?><div class="author">A story by <a href="user.php?uid=<?php echo $story_userid; ?>"><?php echo $story_username; ?></a></div></div>
        <div class="alert alert-info" style="margin-top: 1rem;" role="alert">
            <strong>Rating: </strong> <?php if($story_upvote== NULL) echo "No one has voted yet."; else echo $story_upvote." with ".$story_vote_count." users voted"."."; ?>
        </div>
        <div class="field-content align-start">
            <img class="story-img" src="<?php echo $story_image; ?>">
            <?php echo $story_content; ?>
        </div>
        
    </div>
    <div class="field">
        <div class="field-title">Select a Path to Continue</div>
        <div class="field-content align-start">
            <?php
                while($row = mysqli_fetch_assoc($main_paths)):
                    $username = $row['username'];
                    $summary = $row['summary'];
                    $pid = $row['pid'];
                    $path_upvote = $row['sum'];
            ?>
            <div class="path">
                <div class="username"><strong><?php echo $summary; ?></strong>
                    <div class="author"> written by: <?php echo $username; ?></div
                    </div>
                        </div>
                <div class="upvote"><strong>Rating:</strong> <?php echo $path_upvote; ?></div>
                <a href="path.php?pid=<?php echo $pid; ?>" class="btn btn-primary">Read</a>
            
            <?php
                endwhile;
            ?>
            </div>
        </div>
    </div>

<?php
include "footer.php";
?>
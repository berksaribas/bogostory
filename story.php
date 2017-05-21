<?php
include "default.php";
$sid = $_GET['sid'];

$story_sql = $db -> prepare("SELECT s.*, c.name as cname, u.username, i.link, COUNT(v.vid) AS c, SUM(v.positive) AS sum FROM stories s LEFT JOIN story_votes v ON v.sid=s.sid LEFT JOIN users u ON u.uid=s.uid LEFT JOIN images i ON i.sid=s.sid LEFT JOIN categories c ON c.cid=s.cid WHERE s.sid = ? GROUP BY v.sid");
$story_sql -> bind_param("s", $sid);
$story_sql -> execute();
$story = $story_sql -> get_result();

$main_paths_sql = $db -> prepare("SELECT p.*, u.username, COUNT(v.vid) AS c, SUM(v.positive) AS sum FROM paths p LEFT JOIN path_votes v ON p.pid = v.pid LEFT JOIN users u ON u.uid=p.uid WHERE p.sid = ? AND p.parent_pid IS NULL GROUP BY v.pid ORDER BY sum DESC");
$main_paths_sql -> bind_param("s", $sid);
$main_paths_sql -> execute();
$main_paths = $main_paths_sql -> get_result();

$story_name = NULL;
$story_content = NULL;
$story_vote_count = NULL;
$story_upvote = NULL;
$story_image = NULL;
$story_id = NULL;
$category_name = NULL;
$category_id = NULL;
$story_username = NULL;
$story_userid = NULL;

while($row = mysqli_fetch_assoc($story)){
    $story_name = $row['name'];
    $story_id = $row['sid'];
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
          <li class="breadcrumb-item"><a href="category.php?cid=<?= $category_id; ?>"><?= $category_name; ?></a></li>
          <li class="breadcrumb-item active"><?= $story_name; ?></li>
        </ol>
    </div>
    <div class="field">
        <div class="field-title"><?= $story_name; ?><div class="author">A story by <a href="user.php?uid=<?= $story_userid; ?>"><?= $story_username; ?></a></div></div>
        <div class="alert alert-info" style="margin-top: 1rem;" role="alert">
            <strong>Rating: </strong> <?php if($story_upvote== NULL) echo "No one has voted yet."; else echo $story_upvote." with ".$story_vote_count." users voted"."."; ?>
            <div class="rate-holder">
                <?php if (isset($_SESSION['user_id'])): ?>
                <form action="storyvote.php" method="post">
                    <button name="sid" class="btn btn-primary" value="<?php echo $story_id; ?>">Like</button>
                     <input type="hidden" name="positive" value="1">
                </form>
                <form action="storyvote.php" method="post">
                    <button name="sid" class="btn btn-primary" value="<?php echo $story_id; ?>">Dislike</button>
                     <input type="hidden" name="positive" value="-1">
                </form>
                <?php else: ?>
                    You must login to vote.
                <?php endif; ?>
            </div>
        </div>
        <div class="field-content align-start">
            <img class="story-img" src="<?= $story_image; ?>">
            <?= $story_content; ?>
        </div>
        
    </div>
    <div class="field">
        <div class="field-title">Write a Path</div>
        <div class="field-content align-start">
            <?php if (isset($_SESSION['user_id'])): ?>
            <form action="writepath.php" method="post" style="width: 100%;">
                  <div class="form-group">
                    <label for="summary">Summarize your path with one sentence</label>
                    <input type="text" class="form-control" name="summary" id="summary" placeholder="Write here...">
                  </div>
                <div class="form-group">
                    <label for="content-area">Write your path</label>
                    <textarea class="form-control" rows="3" id="content-area" name="content"></textarea>
                </div>
                <input type="hidden" name="sid" value="<?php echo $story_id; ?>">
                <button type="submit" class="btn btn-primary">Submit</button>
            </form>
            <?php else: ?>
            You must login first.
            <?php endif; ?>
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
                <div class="username"><strong><?= $summary ?></strong>
                    <div class="author"> written by: <?= $username ?></div
                    </div>
                        </div>
                <div class="upvote"><strong>Rating:</strong> <?php if($path_upvote == NULL) echo "No one rated yet"; else echo $path_upvote; ?></div>
                <a href="path.php?pid=<?= $pid ?>" class="btn btn-primary">Read</a>
            </div>
              <?php
                endwhile;
            ?>  
        </div>
    </div>

<?php
include "footer.php";
?>
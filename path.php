<?php
include "default.php";
$pid = $_GET['pid'];

$path_sql = $db -> prepare("SELECT p.*, s.name as sname, c.cid, c.name as cname, u.username, i.link, COUNT(v.vid) AS c, SUM(v.positive) AS sum FROM paths p LEFT JOIN path_votes v ON v.pid=p.pid LEFT JOIN stories s ON s.sid = p.sid LEFT JOIN users u ON u.uid=p.uid LEFT JOIN images i ON i.pid=p.pid LEFT JOIN categories c ON c.cid=s.cid WHERE p.pid = ? GROUP BY v.pid");
$path_sql -> bind_param("s", $pid);
$path_sql -> execute();
$path = $path_sql -> get_result();

$child_paths_sql = $db -> prepare("SELECT p.*, u.username, COUNT(v.vid) AS c, SUM(v.positive) AS sum FROM paths p LEFT JOIN path_votes v ON p.pid = v.pid LEFT JOIN users u ON u.uid=p.uid WHERE p.parent_pid = ? GROUP BY p.pid ORDER BY sum DESC");
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
$path_id = NULL;
$path_parentid = NULL;

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
    $path_id = $row['pid'];
    $path_parentid = $row['parent_pid'];
}

if($path_parentid != NULL){
    $parent_path_sql = $db -> prepare("SELECT p.* FROM paths p WHERE p.pid = ?");
    $parent_path_sql -> bind_param("s", $path_parentid);
    $parent_path_sql -> execute();
    $parent_path = $parent_path_sql -> get_result();
    $parent_path_summary = NULL;
    while($row = mysqli_fetch_assoc($parent_path)){
        $parent_path_summary = $row['summary'];
    }
}

?>

<div class="container">
    <div class="field">
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="index.php">Home</a></li>
            <li class="breadcrumb-item">
                <?php if ($path_parentid == NULL): ?>
                <a href="story.php?sid=<?= $story_id; ?>"><?= $story_name; ?></a>
                <?php else: ?>
                <a href="path.php?pid=<?= $path_parentid; ?>"><?= $parent_path_summary; ?></a>
                <?php endif; ?>
            </li>
            <li class="breadcrumb-item active"><?= $path_summary; ?></li>
        </ol>
    </div>
    <div class="field">
        <div class="field-title"><?= $path_summary; ?><div class="author">A path by <a href="user.php?uid=<?= $path_userid; ?>"><?= $path_username; ?></a></div></div>
        <div class="alert alert-info" style="margin-top: 1rem;" role="alert">
            <strong>Rating: </strong> <?php if($path_upvote== NULL) echo "No one has voted yet."; else echo $path_upvote." with ".$path_vote_count." users voted"."."; ?>
            <div class="rate-holder">
                <?php if (isset($_SESSION['user_id'])):
                    $stmt2 = $db->prepare('SELECT positive FROM path_votes WHERE uid = ? AND pid = ?');
                    $stmt2->bind_param('ss', $_SESSION['user_id'], $pid);
                    $stmt2->execute();

                    $result = mysqli_fetch_array($stmt2->get_result());

                    $check = null;

                    if (isset($result['positive'])) {
                        $checkResult = $result['positive'];

                        $check = '+';

                        if ($checkResult == -1) {
                            $check = '-';
                        }
                    }

                ?>
                <form action="pathvote.php" method="post">
                    <button name="pid" class="btn <?php if($check=='+'): ?>btn-success <?php else: ?> btn-primary <?php endif; ?>" value="<?php echo $path_id; ?>">Like</button>
                     <input type="hidden" name="positive" value="1">
                </form>
                <form action="pathvote.php" method="post">
                    <button name="pid" class="btn <?php if($check=='-'): ?>btn-success <?php else: ?> btn-primary <?php endif; ?>" value="<?php echo $path_id; ?>">Dislike</button>
                     <input type="hidden" name="positive" value="-1">
                </form>
                <?php else: ?>
                    You must login to vote.
                <?php endif; ?>
            </div>
        </div>
        <div class="field-content align-start">
            <img class="story-img" src="<?= $path_image; ?>">
            <?= $path_content; ?>
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
                <input type="hidden" name="pid" value="<?= $path_id ?>">
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
                <div class="upvote"><strong>Rating:</strong> <?php if($path_upvote == NULL) echo "No one rated yet"; else echo $path_upvote; ?></div>
                <a href="path.php?pid=<?= $pid ?>" class="btn btn-primary">Read</a>
            </div>
            <?php
                endwhile;
            ?>
        </div>
    </div>
</div>

<?php
include "footer.php";
?>
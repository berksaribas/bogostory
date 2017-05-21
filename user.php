<?php
include "default.php";
$uid = $_GET['uid'];

$user_sql = $db -> prepare("SELECT u.username, u.image, u.uid, SUM(sv.positive) as story_rating, SUM(pv.positive) as path_rating, (SELECT COUNT(*) FROM stories WHERE uid=u.uid GROUP BY uid) as scount, (SELECT COUNT(*) FROM paths WHERE uid=u.uid GROUP BY uid) as pcount FROM users u LEFT JOIN stories s on u.uid = s.uid LEFT JOIN paths p on u.uid = p.uid LEFT JOIN story_votes sv on s.sid = sv.sid LEFT JOIN path_votes pv on p.pid = pv.pid WHERE u.uid = ? ");
$user_sql -> bind_param("s", $uid);
$user_sql -> execute();
$user = $user_sql -> get_result();

$username = NULL;
$user_id = NULL;
$user_image = NULL;
$story_rating = NULL;
$path_rating = NULL;
$user_story_count = NULL;
$user_path_count = NULL;

$story1_sql = $db -> prepare("SELECT s.*, i.link FROM stories s, images i WHERE i.sid=s.sid AND s.uid = ? ORDER BY sid DESC LIMIT 4");
$story1_sql -> bind_param("s", $uid);
$story1_sql -> execute();
$result1 = $story1_sql -> get_result();

$story2_sql = $db -> prepare("SELECT s.*, i.link FROM stories s, images i WHERE i.sid=s.sid AND s.sid IN (SELECT s.sid FROM paths p, stories s WHERE p.sid=s.sid AND p.uid = ?) ORDER BY sid DESC LIMIT 4");
$story2_sql -> bind_param("s", $uid);
$story2_sql -> execute();
$result2 = $story2_sql -> get_result();

while($row = mysqli_fetch_assoc($user)){
    $username = $row['username'];
    $user_id = $row['uid'];
    $user_image = $row['image'];
    $story_rating = $row['story_rating'];
    $path_rating = $row['path_rating'];
    $user_story_count = $row['scount'];
    $user_path_count = $row['pcount'];
}

if($story_rating == NULL) $story_rating = 0;
if($path_rating == NULL) $path_rating = 0;
if($user_story_count == NULL) $user_story_count = 0;
if($user_path_count == NULL) $user_path_count = 0;


?>
<div class="container">
    <div class="row">
        <div class="col-sm-4">
            <div class="field">
                <div class="field-title">
                    Profile Information
                </div>
                <div class="field-content">
                    <div class="user-info">
                        <div class="user-image">
                            <img src="<?= $user_image ?>">
                        </div>
                        <div class="user-name">
                            <?= $username ?>
                        </div>
                        <div class="stat">Story Karma: <strong><?= $story_rating ?></strong></div>
                        <div class="stat">Path Karma: <strong><?= $path_rating ?></strong></div>
                        <div class="seperator"></div>
                        <div class="stat">Author of <strong><?= $user_story_count ?></strong> stories</div>
                        <div class="stat">Contributed <strong><?= $user_path_count ?></strong> stories</div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-8">
            <div class="field">
                <div class="field-title">
                    Last Stories
                </div>
                <div class="field-content">
                    <?php
                        while($row = mysqli_fetch_assoc($result1)):
                            $sid = $row['sid'];
                            $name = $row['name'];
                            $content = $row['content'];
                            $cid = $row['cid'];
                            $uid = $row['uid'];
                            $img = $row['link'];
                    ?>
                    <div class="card">
                        <div class="row">
                            <div class="col-md-4">
                              <div class="card-img-bottom">
                                  <img class="card-img-top" src="<?= $img ?>">
                              </div>
                            </div>
                            <div class="col-md-8">
                              <div class="card-block">
                                <h4 class="card-title"><?php echo $name; ?></h4>
                                <p class="card-text"><?php echo substr($content,0,160)."..."; ?></p>
                                <a href="story.php?sid=<?php echo $sid; ?>" class="btn btn-primary">Read more</a>
                              </div>
                            </div>
                        </div>
                    </div>
                    <?php
                        endwhile;
                    ?>
                </div>
            </div>
            <div class="field">
                <div class="field-title">
                    Last Contributed Stories
                </div>
                <div class="field-content">
                    <?php
                        while($row = mysqli_fetch_assoc($result2)):
                            $sid = $row['sid'];
                            $name = $row['name'];
                            $content = $row['content'];
                            $cid = $row['cid'];
                            $uid = $row['uid'];
                            $img = $row['link'];
                    ?>
                    <div class="card">
                        <div class="row">
                            <div class="col-md-4">
                              <div class="card-img-bottom">
                                  <img class="card-img-top" src="<?= $img ?>">
                              </div>
                            </div>
                            <div class="col-md-8">
                              <div class="card-block">
                                <h4 class="card-title"><?php echo $name; ?></h4>
                                <p class="card-text"><?php echo substr($content,0,160)."..."; ?></p>
                                <a href="story.php?sid=<?php echo $sid; ?>" class="btn btn-primary">Read more</a>
                              </div>
                            </div>
                        </div>
                    </div>
                    <?php
                        endwhile;
                    ?>
                </div>
            </div>
        </div>
    </div>
</div>

<?php
include "footer.php";
?>
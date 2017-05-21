<?php
include "default.php";
$uid = $_GET['uid'];

$user_sql = $db -> prepare("SELECT u.username, u.image, u.uid, SUM(v.positive) as rating, (SELECT COUNT(*) FROM stories WHERE uid=u.uid GROUP BY uid) as scount, (SELECT COUNT(*) FROM paths WHERE uid=u.uid GROUP BY uid) as pcount FROM users u LEFT JOIN stories s on u.uid = s.uid LEFT JOIN paths p on u.uid = p.uid LEFT JOIN votes v on s.sid = v.sid OR p.pid = v.pid WHERE u.uid = ? ");
$user_sql -> bind_param("s", $uid);
$user_sql -> execute();
$user = $user_sql -> get_result();

$username = NULL;
$user_id = NULL;
$user_image = NULL;
$rating = NULL;
$user_story_count = NULL;
$user_path_count = NULL;

$story1_sql = $db -> prepare("SELECT s.*, i.link FROM stories s, images i WHERE i.sid=s.sid AND s.uid = ? ORDER BY sid DESC LIMIT 4");
$story1_sql -> bind_param("s", $uid);
$story1_sql -> execute();
$result1 = $story1_sql -> get_result();
$stories = mysqli_fetch_array($result1);

$story2_sql = $db -> prepare("SELECT s.*, i.link FROM stories s, images i WHERE i.sid=s.sid AND s.sid IN (SELECT s.sid FROM paths p, stories s WHERE p.sid=s.sid AND p.uid = ?) ORDER BY sid DESC LIMIT 4");
$story2_sql -> bind_param("s", $uid);
$story2_sql -> execute();
$result2 = $story2_sql -> get_result();
$storiesContributed = mysqli_fetch_array($result2);

while($row = mysqli_fetch_assoc($user)){
    $username = $row['username'];
    $user_id = $row['uid'];
    $user_image = $row['image'];
    $rating = $row['rating'];
    $user_story_count = $row['scount'];
    $user_path_count = $row['pcount'];
}

if($rating == NULL) $rating = 0;
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
                        <div class="stat">Karma: <strong><?= $rating ?></strong></div>
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
                    meraba
                </div>
            </div>
            <div class="field">
                <div class="field-title">
                    Last Contributed Stories
                </div>
                <div class="field-content">
                    meraba
                </div>
            </div>
        </div>
    </div>
</div>

<?php
include "footer.php";
?>
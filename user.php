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
                            <img src="<?php echo $user_image; ?>">
                        </div>
                        <div class="user-name">
                            <?php echo $username ?>
                        </div>
                        <div class="stat">Karma: <strong><?php echo $rating ?></strong></div>
                        <div class="seperator"></div>
                        <div class="stat">Author of <strong><?php echo $user_story_count; ?></strong> stories</div>
                        <div class="stat">Contributed <strong><?php echo $user_path_count; ?></strong> stories</div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-8">
            <div class="field">
                <div class="field-title">
                    Stories Written
                </div>
                <div class="field-content">
                    meraba
                </div>
            </div>
            <div class="field">
                <div class="field-title">
                    Stories Contributed
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
<?php
include "default.php";
$latest_stories_sql = $db -> prepare("SELECT s.*, i.link FROM stories s, images i WHERE i.sid=s.sid ORDER BY sid DESC LIMIT 4");
$latest_stories_sql -> execute();
$latest_stories = $latest_stories_sql -> get_result();

$featured_stories_sql = $db -> prepare("SELECT s.*, i.link, COUNT(v.vid) AS c, SUM(v.positive) AS sum FROM stories s LEFT JOIN votes v ON v.sid=s.sid LEFT JOIN images i ON i.sid=s.sid GROUP BY v.sid ORDER BY sum DESC LIMIT 4");
$featured_stories_sql -> execute();
$featured_stories = $featured_stories_sql -> get_result();

?>
<div class="container">
    <div class="field">
        <div class="field-title">Latest Stories</div>
        <div class="field-content">
            <?php
                while($row = mysqli_fetch_assoc($latest_stories)):
                    $sid = $row['sid'];
                    $name = $row['name'];
                    $content = $row['content'];
                    $cid = $row['cid'];
                    $uid = $row['uid'];
                    $img = $row['link'];
                    ?>
            <div class="card" style="width: 15rem;">
              <img class="card-img-top" src="<?= $img ?>" alt="Card image cap">
              <div class="card-block">
                <h4 class="card-title"><?= $name ?></h4>
                <p class="card-text"><?= substr($content,0,100)."..." ?></p>
                <a href="story.php?sid=<?= $sid ?>" class="btn btn-primary">Read more</a>
              </div>
            </div>
            <?php
                endwhile;
            ?>
        </div>
    </div>
    <div class="field">
        <div class="field-title">Featured Stories</div>
        <div class="field-content">
            <?php
                while($row = mysqli_fetch_assoc($featured_stories)):
                    $sid = $row['sid'];
                    $name = $row['name'];
                    $content = $row['content'];
                    $cid = $row['cid'];
                    $uid = $row['uid'];
                    $img = $row['link'];
                    ?>
            <div class="card" style="width: 15rem;">
              <img class="card-img-top" src="<?= $img ?>" alt="Card image cap">
              <div class="card-block">
                <h4 class="card-title"><?= $name ?></h4>
                <p class="card-text"><?= substr($content,0,100)."..." ?></p>
                <a href="story.php?sid=<?= $sid ?>" class="btn btn-primary">Read more</a>
              </div>
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
<?php
include "default.php";
$cid = $_GET['cid'];
$category_stories_sql = $db -> prepare("SELECT s.*, i.link FROM stories s, categories c, images i WHERE s.sid = i.sid AND s.cid = c.cid AND c.cid = ?");
$category_stories_sql -> bind_param("s", $cid);
$category_stories_sql -> execute();
$category_stories = $category_stories_sql -> get_result();
?>

<div class="container">
    <div class="field">
        <div class="field-title">Stories of Selected Category</div>
        <div class="field-content">
            <?php
                while($row = mysqli_fetch_assoc($category_stories)):
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
                <a href="story.php?sid=<?= $sid; ?>" class="btn btn-primary">Read more</a>
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
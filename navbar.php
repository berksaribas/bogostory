<?php
$categories_sql = 'SELECT * FROM categories';
$categories = mysqli_query($db, $categories_sql);
?>
<nav class="navbar navbar-toggleable-md navbar-light bg-faded">
  <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <a class="navbar-brand" href="index.php">Bogo Story</a>
  <div class="collapse navbar-collapse" id="navbarNavDropdown">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="index.php">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="http://example.com" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Categories
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
            <?php while($row = mysqli_fetch_assoc($categories)):
                $cid = $row['cid'];
                $name = $row['name'];
            ?>
          <a class="dropdown-item" href="category.php?cid=<?= $cid ?>"><?= $name ?></a>
            <?php endwhile; ?>
        </div>
      </li>
    </ul>
	<ul class="navbar-nav">
		<li class="nav-item my-2 my-lg-0">
            <?php if (isset($_SESSION['user_id'])): ?>
            <a class="nav-link" href="logout.php">Logout</a>
            <?php else: ?>
			<a class="nav-link" href="login.php">Login/Register</a>
            <?php endif; ?>
		</li>
	</ul>
  </div>
</nav>
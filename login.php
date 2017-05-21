<?php

include "default.php";

$error = false;

if (!empty($_POST['email']) && !empty($_POST['password'])) {

    $records = $db->prepare('SELECT uid, email, password FROM users WHERE email = ?');
    $records->bind_param('s', $_POST['email']);
    $records->execute();
    $results = mysqli_fetch_array($records->get_result());

    if (count($results) > 0 && password_verify($_POST['password'], $results['password'])) {
        $_SESSION['user_id'] = $results['uid'];
        header("Location: /");
    }

    $error = true;
}

?>

<div class="container">
    <form action="login.php" method="POST">
        <div class="form-group">
            <label for="email">Email address:</label>
            <input type="email" class="form-control" name="email" id="email">
        </div>
        <div class="form-group">
            <label for="pwd">Password:</label>
            <input type="password" class="form-control" name="password" id="pwd">
        </div>
        <!--
        <div class="checkbox">
            <label><input type="checkbox"> Remember me</label>
        </div>
        -->
        <button type="submit" class="btn btn-default">Login</button>
    </form>
    <?php if ($error): ?>
        <div class="alert alert-danger">
            <strong>Sorry!</strong> There is a problem with either the email or the password.
        </div>
    <?php endif; ?>
    <div> Don't have an account? <a href="register.php">Sign Up!</a></div>
</div>

<?php include "footer.php"; ?>



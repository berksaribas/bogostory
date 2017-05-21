<?php

include "default.php";

if( isset($_SESSION['user_id']) ){
    header("Location: /");
}

$success = false;

$message = '';

if(!empty($_POST['email']) && $_POST['username'] &&!empty($_POST['password'])) {
    do {
        $email = trim($_POST['email']);
        $username = trim($_POST['username']);
        $password  = password_hash($_POST['password'], PASSWORD_BCRYPT);

        // Checking the existence of the email
        $sql = "SELECT EXISTS(SELECT 1 FROM users WHERE email = ?) as test";
        $stmt = $db->prepare($sql);
        $stmt->bind_param('s', $email);

        if (!$stmt->execute()) {
            $message = 'There has been a problem.';
            break;
        }

        $count = mysqli_fetch_assoc($stmt->get_result())['test'];

        if ($count) {
            $message = 'This email is already registered for another user.';
            break;
        }

        // Checking the existence of the username
        $sql = "SELECT EXISTS(SELECT 1 FROM users WHERE username = ?) as test";
        $stmt = $db->prepare($sql);
        $stmt->bind_param('s', $username);

        if (!$stmt->execute()) {
            $message = 'There has been a problem.';
            break;
        }

        $count = mysqli_fetch_assoc($stmt->get_result())['test'];

        if ($count) {
            $message = 'This username has been taken.';
            break;
        }

        // Register the user
        $sql = "INSERT INTO users (email, username, password) VALUES (?, ?, ?)";
        $stmt = $db->prepare($sql);
        $stmt->bind_param('sss', $email, $username, $password);

        if ($stmt->execute()) {
            $success = true;
            break;
        }

        $message = 'Sorry there must have been an issue creating your account';

    } while (0);
}

?>

<div class="container">
    <form action="register.php" method="POST">
        <div class="form-group">
            <label for="email">Email address:</label>
            <input type="email" class="form-control" name="email" id="email">
        </div>
        <div class="form-group">
            <label for="username">Username:</label>
            <input type="name" class="form-control" name="username" id="username">
        </div>
        <div class="form-group">
            <label for="pwd">Password:</label>
            <input type="password" class="form-control" name="password" id="pwd">
        </div>
        <button type="submit" class="btn btn-default">Register</button>
    </form>
    <?php if ($success): ?>
        <div class="alert alert-success">
            <strong>Congratulations!</strong> You have created an account! You can <a href="login.php">login here.</a>
        </div>
    <?php else:
        if ($message): ?>
        <div class="alert alert-danger">
            <strong>Sorry!</strong> <?= $message ?>
        </div>
        <?php endif; ?>
    <?php endif; ?>
    <div> Already have an account? <a href="login.php">Login!</a></div>
</div>

<?php include "footer.php"; ?>



<?php

session_start();

if(!isset($_SESSION["session_username"])):
	header("location:login.php");
else:
	?>
	
	<?php include("includes/header.php"); ?>
	<div id="welcome">
		<h2>Добро пожаловать, <span><?php echo $_SESSION['session_username'];?>! </span></h2>
		<a href="users.php">Пользователи</a>
		<p><a href="logout.php">Выйти</a> из системы</p>
	</div>
	
	<?php include("includes/footer.php"); ?>
	
<?php endif; ?>

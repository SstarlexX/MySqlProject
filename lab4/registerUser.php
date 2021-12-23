<?php include("includes/header.php"); ?>

<div class="container mregister">
	<div id="login">
		<h1>Регистрация</h1>
		<form action="registerUser.php" id="registerform" method="post"name="registerform">
			<p><label for="user_login">Полное имя<br>
				<input class="input" id="full_name" name="full_name"size="32"  type="text" value=""></label></p>
				<p><label for="user_pass">Имя пользователя<br>
					<input class="input" id="username" name="username"size="20" type="text" value=""></label></p>
					<p><label for="user_pass">Пароль<br>
						<input class="input" id="password" name="password"size="32"   type="password" value=""></label></p>
						<p><label for="user_pass">Код (Для тренерів)<br>
							<input class="input" id="cod" name="cod"size="32"   type="password" value=""></label></p>
							<p class="submit"><input class="button" id="register" name= "registerUser" type="submit" value="Зарегистрироваться"></p>
							<p class="regtext">Уже зарегистрированы? <a href= "login.php">Введите имя пользователя</a>!</p>
						</form>
					</div>
				</div>

				<?php

				if(isset($_POST["registerUser"])){

					if(!empty($_POST['full_name']) && !empty($_POST['username']) && !empty($_POST['password'])) {
						$full_name = filter_var(htmlspecialchars($_POST['full_name']), FILTER_SANITIZE_STRING);
						$username = filter_var(htmlspecialchars($_POST['username']), FILTER_SANITIZE_STRING);
						$password = htmlspecialchars($_POST['password']);
						$cod = filter_var($_POST['cod'],FILTER_SANITIZE_NUMBER_INT);
						if(filter_var($cod, FILTER_VALIDATE_INT)==1122)
						{
							$query=mysqli_query($con, "SELECT * FROM trainers WHERE login='".$username."'");
							$numrows=mysqli_num_rows($query);
							if($numrows==0)
							{
								$id = mysqli_num_rows(mysqli_query($con, "SELECT id FROM trainers"));
								$sql="INSERT INTO trainers
								(id, trainer_name, login, password)
								VALUES('$id', '$full_name', '$username', '$password')";
								$result=mysqli_query($con, $sql);
								if($result){
									$message = "Account Successfully Created";
								} else {
									$message = "Failed to insert data information!";
								}
							} else {
								$message = "That username already exists! Please try another one!";
							}
						}else{
							$query=mysqli_query($con, "SELECT * FROM users WHERE login='".$username."'");
							$numrows=mysqli_num_rows($query);
							if($numrows==0)
							{
								$sql="INSERT INTO users
								(user_name, login, password)
								VALUES('$full_name', '$username', '$password')";
								$result=mysqli_query($con, $sql);
								if($result){
									$message = "Account Successfully Created";
								} else {
									$message = "Failed to insert data information!";
								}
							} else {
								$message = "That username already exists! Please try another one!";
							}
						}
					} else {
						$message = "All fields are required!";
					}
				}
				?>

				<?php if (!empty($message)) {echo "<p class='error'>" . "MESSAGE: ". $message . "</p>";} ?>

				<?php include("includes/footer.php"); ?>
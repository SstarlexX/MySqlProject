<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Document</title>
	<style>
		table,td {
			border: 1px solid #333333;
			border-collapse: collapse;
			padding:10px;

		}
	</style>
</head>
<body>


	<a href="logout.php">Выйти из систем</a><br><br>


	<?php 

			session_start();

			if(!isset($_SESSION["session_username"])):
				header("location:login.php");
			else:


		$host = "localhost";
		$user = "root";
		$password = "";
		$database = "gym";

		mysqli_report(MYSQLI_REPORT_ERROR | MYSQLI_REPORT_STRICT);

		// connect to mysql database
		try{
		    $connect = mysqli_connect($host, $user, $password, $database);
		} catch (mysqli_sql_exception $ex) {
		    echo 'Error';
		}
		$SessionUsername = $_SESSION["session_username"];
		$isTrainer = mysqli_num_rows(mysqli_query($connect, "SELECT login FROM trainers WHERE login = '$SessionUsername'"));
		$id = "";
		$user_name = "";
		$login = "";
		$password = "";
		$subscription_id = "";

		function getPosts()
			{
			    $posts = array();
			    $posts[0] = $_POST['id'];
			    $posts[1] = $_POST['user_name'];
			    $posts[2] = $_POST['login'];
			    $posts[3] = $_POST['password'];
			    $posts[4] = $_POST['subscription_id'];
			    return $posts;
			}


			$sql = "SELECT * FROM users ORDER BY 'ASC'";

				if (!$result = mysqli_query($connect, $sql)) {
			    echo "Извините, возникла проблема в работе сайта.";
			    exit;
			}

			echo "<table>\n";
			echo "<thead><tr><th colspan = '4'>Пользователи</tr></th></thead>\n";
				while ($admin = $result->fetch_assoc()) {
					echo "<tr>\n";
				    echo "<td>" . $admin['id'] . "</td><td>". $admin['user_name'] . "</td><td>" . $admin['login'] . "</td><td>" . $admin['password'] . "</td><td>" . $admin['subscription_id'] . "</td>";
				    echo "</tr>";
				}

			echo "</table>\n";


			// Search
			if(isset($_POST['search']))
			{
			    $data = getPosts();
			    
			    $search_Query = "SELECT * FROM users WHERE id = $data[0]";
			    
			    $search_Result = mysqli_query($connect, $search_Query);
			    
			    if($search_Result)
			    {
			        if(mysqli_num_rows($search_Result))
			        {
			            while($row = mysqli_fetch_array($search_Result))
			            {
			                $id = $row['id'];
			                $user_name = $row['user_name'];
			                $login = $row['login'];
			                $password = $row['password'];
			                $subscription_id = $row['subscription_id'];
			            }
			        }else{
			            echo 'No Data For This Id';
			        }
			    } else{
			        echo 'Result Error';
			    }
			}

			

			// Insert
			if(isset($_POST['insert']) && $isTrainer)
			{
			    $data = getPosts();
			    $insert_Query = "INSERT INTO `users`(`user_name`, `login`, `password`, `subscription_id`) VALUES ('$data[1]' ,'$data[2]', '$data[3]', '$data[4]')";
			    try{
			        $insert_Result = mysqli_query($connect, $insert_Query);
			        
			        if($insert_Result)
			        {
			            if(mysqli_affected_rows($connect) > 0)
			            {
			                echo 'Data Inserted';
			            }else{
			                echo 'Data Not Inserted';
			            }
			        }
			    } catch (Exception $ex) {
			        echo 'Error Insert '.$ex->getMessage();
			    }
			}


			// Delete
			if(isset($_POST['delete']) && $isTrainer)
			{
			    $data = getPosts();
			    $delete_Query = "DELETE FROM `users` WHERE `id` = $data[0]";
			    try{
			        $delete_Result = mysqli_query($connect, $delete_Query);
			        
			        if($delete_Result)
			        {
			            if(mysqli_affected_rows($connect) > 0)
			            {
			                echo 'Data Deleted';
			            }else{
			                echo 'Data Not Deleted';
			            }
			        }
			    } catch (Exception $ex) {
			        echo 'Error Delete '.$ex->getMessage();
			    }
			}


			// Edit
			if(isset($_POST['update']) && $isTrainer)
			{
			    $data = getPosts();
			    $update_Query = "UPDATE `users` SET `user_name`='$data[1]',`login`='$data[2]',`password`='$data[3]',`subscription_id`='$data[4]' WHERE `id` = $data[0]";
			    try{
			        $update_Result = mysqli_query($connect, $update_Query);
			        
			        if($update_Result)
			        {
			            if(mysqli_affected_rows($connect) > 0)
			            {
			                echo 'Data Updated';
			            }else{
			                echo 'Data Not Updated';
			            }
			        }
			    } catch (Exception $ex) {
			        echo 'Error Update '.$ex->getMessage();
			    }
			}


		?>
<?php endif; ?>

	<form action="users.php" method="post"><br><br>
		<input type="number" name = "id" placeholder = "id" value="<?php echo $id;?>"><br><br>
		<input type="text" name = "user_name" placeholder = "user_name" value="<?php echo $user_name;?>"><br><br>
		<input type="text" name = "login" placeholder = "login" value="<?php echo $login;?>"><br><br>
		<input type="text" name = "password" placeholder = "password" value="<?php echo $password;?>"><br><br>
		<input type="number" name = "subscription_id" placeholder = "subscription_id" value="<?php echo $subscription_id;?>"><br><br>
		
		<div>
			<input type="submit" name = "insert" value="Add">
			<input type="submit" name = "update" value="Update">
			<input type="submit" name = "delete" value="Delete">
			<input type="submit" name = "search" value="Search">
		</div>
	</form>
</body>
</html>
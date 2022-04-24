<?php

    include "connect.php";
    
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="login.css">
    <title>Login Page</title>
</head>
<body>
<div class="hero">
        <div class="form-box">
            <div class="button-box">
                <div id="btn"></div>
                <button type="button" class="toggle-btn" onclick="login()">Log In</button>
                <button type="button" class="toggle-btn" onclick="register()">Register</button>
            </div>
            <img class="logo" src="logo.png" alt="we_connect_logo" height=70px width=150px>

            <!-- user input for log in-->
            <form  id="login" class="input-group" method ="POST">
                <input type="text" id="user_id" name="user_id" class="input-field" placeholder="User Id" required>
                <input type="password" id = "user_password" name="user_password" class="input-field" placeholder="Enter Password" required>
                <!--<div><input type="checkbox" class="checkbox"><span> Remember Password</span></div>-->
                <button type="submit" name = "logInBtn" class="submit-btn">Log in</button>
    
            </form>

            <!-- user input for registeration -->
    
            <form id="register" class="input-group" method = "POST">    
                <input type="text" name="first_name" id="first_name" class="input-field" placeholder="first name" required>
                <input type="text" name="last_name" id="last_name" class="input-field" placeholder="last name">
                <input type="text" name = "user_name" id="user_name" class="input-field" placeholder="User Name" required>
                <input type="email" name ="email" id="email" class="input-field" placeholder="Email" required>
                <input type="password" name="password" id="password" class="input-field" placeholder="Enter Password" required>
                <!--<div><input type="checkbox" class="checkbox"><span> Remember Password</span></div>-->
                <button type="submit" name="submit_btn" class="submit-btn">Register</button> 
            </form>  
        </div>
        
        
           
</div>

<script>
    var x = document.getElementById("login");
    var y = document.getElementById("register");
    var z = document.getElementById("btn");

    function register(){
        x.style.left = "-400px";
        y.style.left = "10px";
        z.style.left = "110px";
    }

    function login(){
        x.style.left = "10px";
        y.style.left = "450px";
        z.style.left = "0px";
    }
</script>




<?php 

if(isset($_POST['submit_btn'])){
    $fname = $_POST['first_name'];
    $lname = $_POST['last_name'];
    $uname = $_POST['user_name'];
    $email = $_POST['email'];
    $password = $_POST['password'];

    mysqli_query($conn,"insert into Customer(Fname,Lname,Uname,Customer_email,Customer_password) values ('$fname','$lname','$uname','$email','$password')");


    
}

if(isset($_POST['logInBtn'])){
    $uname1 = $_POST['user_name'];
    $pswrd = $_POST['password'];

    //checking if log in details are that of a developer or an employer
    //redirects users to dashboard based on data inputs. 

    $sql_C = "select * from Customer where Uname ='".$uname."'AND Customer_password ='".$pswrd."'limit 1";
    $sql_D = "select * from Developer where Uname ='".$uname."'AND Dev_password ='".$pswrd."'limit 1";

    $result = mysqli_query($conn, $sql_D);
    $result1 = mysqli_query($conn,$sql_C);

    if(mysqli_num_rows($result1) > 0){
        header("location: ");

        exit();
    }
    if(mysqli_num_rows($result) > 0){
        header("location: ");
        exit();

    } else{
        echo "<script language = 'javascript'>;
        alert('Incorrect details');
        </script>";
        exit();

    }

    
}



?>
</body>
</html>
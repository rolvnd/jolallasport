<?php

    session_start();

    require "connection.php";

    $_SESSION["logged"] = false;

    $error = "";
    $success = "";

    if(isset($_POST["reg"])){

        $user = $_POST["user"];
        $pwd = $_POST["pwd"];
        $email = $_POST["email"];

        if(empty($user) || empty($email) || empty($pwd)){

            $error = "Minden mező kitöltése kötelező!";
        }

        else if(strlen($pwd) < 6){

            $error = "A jelszó min. 6 karakter legyen!";
        }
        else if(!preg_match('/^(?=.*\d)(?=.*[@#\-_$%^&+=§!\?])(?=.*[a-z])(?=.*[A-Z])[0-9A-Za-z@#\-_$%^&+=§!\?]{8,20}$/',$pwd)){

            $error = "A jelszó nem felel meg a követelményeknek!";
        }
        else{

            $con = mysqli_connect(host,user,pwd,dbname);
            mysqli_query($con, "SET NAMES utf8");
 
            $user_sql = "SELECT * FROM adatok WHERE user='$user'";
            $user_exist = mysqli_query($con, $user_sql);

            if(mysqli_num_rows($user_exist) >= 1){

                $error = "Foglalt felhasználónév!";
            }

            else{

                $sql = "INSERT INTO adatok(user,email,pwd) VALUES('$user', '$email', sha1('$pwd'))";

                mysqli_query($con, $sql);
    
                $success = "Sikeres regisztáció!";

            }

           
        }
    }

    if(isset($_POST["login"])){

        $user = $_POST["user"];
        $pwd = sha1($_POST["pwd"]);
        

        if(empty($user) ||  empty($pwd)){

            $error = "Minden mező kitöltése kötelező!";
        }
        else{

            $con = mysqli_connect(host,user,pwd,dbname);
            mysqli_query($con, "SET NAMES utf8");

            $sql = "SELECT user,pwd FROM adatok WHERE user='$user' AND pwd='$pwd'";

            $result = mysqli_query($con, $sql);

            if(mysqli_num_rows($result) == 1){

                $_SESSION["logged"] = true;
                $_SESSION["user"] = $user;
                header("Location: index.php");
            }
            else{

                $error = "Belépési hiba! Nem megfelelő felhasználónév - jelszó páros!";
            }
        }

    }



?>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta name="Description" content="Enter your description here"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.0/css/all.min.css">
<title>Bejelentkezés/Regisztráció</title>
</head>
<body>

    <div class="container">

        <div class="row justify-content-center">
            <form action="" method="post" class="form-group text-center p-5 rounded">

                <p class="text-danger mb-3"><?php  if(!empty($error)){ echo $error; }  ?></p>
                <p class="text-success mb-3"><?php  if(!empty($success)){ echo $success; }  ?></p>

                <label for="">Felhasználónév</label>
                <input type="text" name="user" class="form-control mb-3">

                <label for="">E-mail cím</label>
                <input type="email" name="email" class="form-control mb-3">

                <label for="">Jelszó</label>
                <input type="password" name="pwd" class="form-control mb-3">

                <button type="submit" name="login" class="btn btn-success">Bejelentkezés</button>
                <button type="submit" name="reg" class="btn btn-primary">Regisztráció</button>
                

                <div class="mt-5 text-left">
                    <ul>
                        A jelszónak tartalmaznia kell legalább egy:
                        <li>a-z (kisbetűt)</li>
                        <li>A-Z (nagybetűt)</li>
                        <li>0-9 (számot)</li>
                        <li>speciális karaktert  -  @#-_$%?!&+</li>
                    </ul>
                </div>


            </form>
        </div>

    </div>

</body>
</html>
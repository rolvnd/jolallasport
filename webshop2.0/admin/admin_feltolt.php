<?php
    
    require "../connection.php";

    $error = "";
    $success = "";

    if(isset($_POST["upload"])){

        $target = "../img/".$_FILES["file"]["name"];

        $termekkep = $_FILES["file"]["name"];
        $termeknev = $_POST["termeknev"];
        $termekar = $_POST["termekar"];
        $kategoria = $_POST["kategoria"];
        $cikkszam = $_POST["cikkszam"];
        $keszlet = $_POST["keszlet"];
        $rleiras = $_POST["rleiras"];
        $hleiras = $_POST["hleiras"];

        if(empty($termekkep) || empty($termeknev) || empty($termekar) || empty($cikkszam) || empty($keszlet) || empty($rleiras) || empty($hleiras)){

            $error = "Termék feltöltéséhéz minden mező kitöltése kötelező!";
        }
        else{

            $con = mysqli_connect(host,user,pwd,dbname);
            mysqli_query($con, "SET NAMES utf8");

            $sql = "INSERT INTO termekek(kategoria,nev,cikkszam,ar,rleiras,hleiras,kep,keszlet,aktiv) VALUES('$kategoria', '$termeknev', '$cikkszam', '$termekar', '$rleiras', '$hleiras', 'img/$termekkep', '$keszlet', '1')";

            mysqli_query($con, $sql);

            move_uploaded_file($_FILES["file"]["tmp_name"], $target);

            $success = "Sikeres termékfeltöltés!";
        }
    }



?>
<!DOCTYPE html>
<html lang="hu">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta name="Description" content="Enter your description here"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/css/bootstrap.min.css">
<title>PHP Webshop Admin</title>
</head>
<body>

    <div class="container">
        <div class="row justify-content-center">
            <form enctype="multipart/form-data" action="" method="post" class="form-group text-center p-5">

                <p class="text-danger mb-4"> <?php  if(!empty($error)){ echo $error;}  ?> </p>
                <p class="text-success mb-4"><?php  if(!empty($success)){ echo $success;}  ?></p>

                <h1 class="mb-3">Termékek feltöltése</h1>

                <label for="">Termékkép</label>
                <input type="file" name="file" class="form-control mb-3">

                <label for="">Terméknév</label>
                <input type="text" name="termeknev" class="form-control mb-3">

                <label for="">Termékár</label>
                <input type="text" name="termekar" class="form-control mb-3">

                <label for="">Kategória</label>
                <select name="kategoria" class="form-control mb-3">
                    <?php

                        $con = mysqli_connect(host,user,pwd,dbname);
                        mysqli_query($con, "SET NAMES utf8");

                        $sql = "SELECT id,katnev FROM kategoriak ORDER BY katsorrend ASC";

                        $result = mysqli_query($con, $sql);

                        while($row = mysqli_fetch_array($result)){

                            $id = $row["id"];
                            $katnev = $row["katnev"];

                            echo "

                                <option value='$id'>".$katnev."</option>

                            ";
                        }

                    ?>
                </select>

                <label for="">Cikkszám</label>
                <input type="text" name="cikkszam" class="form-control mb-3">

                <label for="">Készlet</label>
                <input type="text" name="keszlet" class="form-control mb-3">

                <label for="">Termék rövid leírása</label>
                <input type="text" name="rleiras" class="form-control mb-3">

                <label for="">Termék részletes leírása</label>
                <textarea name="hleiras" class="form-control mb-3" cols="50" rows="10"></textarea>

                <button tpye="submit" name="upload" class="btn btn-primary">Termék feltöltése</button>


            </form>
        </div>
    </div>

</body>
</html>
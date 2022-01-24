<?php require "header.php"; ?>

<div id="top">
    <img id="logo" src="img/logo.png" alt="">
    <?php require "menu.php"; ?>
</div>

<div id="left">
    <?php require "kategoria.php";  ?>
</div>

<div id="right">
    <div id="sort">
        <a href="?sort=price_asc">Ár szerint növekvő</a>
        <a href="?sort=price_desc">Ár szerint csökkenő</a>
        <a href="?sort=newest">Legújabb termék</a>
        <a href="?sort=best">Legnépszerűbb termék</a>
    </div>


    <?php

        $con = mysqli_connect(host,user,pwd,dbname);
        mysqli_query($con, "SET NAMES utf8");

        if(isset($_GET["katid"])){
            $katid = $_GET["katid"];

            $sql = "SELECT * FROM termekek WHERE kategoria='$katid'";
        }
        else{

            $sql = "SELECT * FROM termekek ORDER BY id DESC";
        }

        if(isset($_GET["sort"])){

            $sort = $_GET["sort"];

            switch($sort){

                case "price_asc" :
                    $sql = "SELECT * FROM termekek ORDER BY ar ASC";
                break;

                case "price_desc" :
                    $sql = "SELECT * FROM termekek ORDER BY ar DESC";
                break;

                case "newest" :
                    $sql = "SELECT * FROM termekek ORDER BY id DESC";
                break;

                default:
                    $sql = "SELECT * FROM termekek ORDER BY id DESC";
                break;
            }

        }

        $result = mysqli_query($con, $sql);

        while($row = mysqli_fetch_array($result)){

            $id = $row["id"];
            $termeknev = $row["nev"];
            $termekar = $row["ar"];
            $termekkep = $row["kep"];
            $keszlet = $row["keszlet"];

            echo "

                <div class='termekdoboz'>
                    <div class='termekkep'>
                        <a href='termek.php?termekid=$id'>
                            <img src='$termekkep' alt='' title='' />
                        </a>
                    </div>

                    <div class='termeknev'>".$termeknev."</div>
                    <div class='keszlet'> Készlet: ".$keszlet." db</div>
                    <div class='termekar'>".number_format($termekar, 0,".",".")." Ft</div>

                    <div class='termekkosar'>
                        <a href='kosarmuvelet.php?id=$id&action=add'>Kosárba</a>
                    </div>
                </div>
            
            ";
        }


    ?>
</div>

</body>
</html>
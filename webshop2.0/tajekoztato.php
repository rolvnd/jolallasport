<?php require "header.php"; ?>

<div id="top">
    <img id="logo" src="img/logo.png" alt="">
    <?php require "menu.php"; ?>
</div>

<div id="left">
    <?php require "kategoria.php";  ?>
</div>

<div id="right">
    <?php

        $con = mysqli_connect(host,user,pwd,dbname);
        mysqli_query($con, "SET NAMES utf8");

        $sql = "SELECT * FROM tajekoztato";

        $result = mysqli_query($con, $sql);

        while($row = mysqli_fetch_array($result)){

            $cim = $row["cim"];
            $content = $row["content"];

            echo "

                <div id='tajekoztato'>
                    <h1>".$cim."</h1>
                    ".$content."
                </div>
            
            ";

        }

    ?>
</div>

</body>
</html>
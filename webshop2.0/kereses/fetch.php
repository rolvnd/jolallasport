<?php

    $con = mysqli_connect("localhost", "root", "", "webshop");
    mysqli_query($con, "SET NAMES utf8");

    $search = mysqli_real_escape_string($con, $_POST["search"]);

    $sql = "SELECT id,nev,ar FROM termekek WHERE nev LIKE '%$search%'";

    $result = mysqli_query($con, $sql);

    if(mysqli_num_rows($result) > 0){

        while($row = mysqli_fetch_array($result)){

            $id = $row["id"];
            $termeknev = $row["nev"];
            $termekar = $row["ar"];

            echo "

            <div class='d-flex justify-content-between list-group-item list-group-item-action'>
                <a href='termek.php?termekid=$id'>".$termeknev."</a>

                <span>".number_format($termekar, 0, ".", ".")." Ft</span>
            </div>
            
            ";
        }
    }
    else{

        echo "<a href='#' class='list-group-item list-group-item-action'>Nincs ilyen termék!</a>";
    }
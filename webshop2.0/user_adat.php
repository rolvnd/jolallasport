<?php require "header.php"; ?>

<div id="top">
    <img id="logo" src="img/logo.png" alt="">
    <?php require "menu.php"; ?>
</div>

<div id="left">
    <?php require "kategoria.php";  ?>
</div>

<div id="right">
   
   <h2> <?php echo $_SESSION["user"]." rendeléseinek megtekintése:";  ?> </h2>


    <table width="95%" align="center" cellpadding="7">
        <tr>
            <th>Azonosító</th>
            <th>Terméknév</th>
            <th>Termékár</th>
            <th>Darabszám</th>
            <th>Érték</th>
            <th>Termékkép</th>
        </tr>

        <?php

            $user = $_SESSION["user"];

            $con = mysqli_connect(host,user,pwd,dbname);
            mysqli_query($con, "SET NAMES utf8");

            $sql = "SELECT termekid,termekek.nev,termekek.ar,db,termekek.kep FROM vevok INNER JOIN rendelesek ON vevok.id=rendelesek.vevoid INNER JOIN rend_term ON rendelesek.id=rend_term.rendelesid INNER JOIN termekek ON rend_term.termekid=termekek.id WHERE vevok.felh LIKE '$user'";

            $result = mysqli_query($con, $sql);

            while($row = mysqli_fetch_array($result)){

                $id = $row["termekid"];
                $termeknev = $row["nev"];
                $termekar = $row["ar"];
                $db = $row["db"];
                $ertek = $db * $termekar;
                $termekkep = $row["kep"];

                echo "
                    <tr align='left'>
                        <td>".$id."</td>
                        <td>".$termeknev."</td>
                        <td>".number_format($termekar, 0, ".", ".")." Ft</td>
                        <td>".$db."</td>
                        <td>".number_format($ertek, 0, ".", ".")." Ft</td>
                        <td> 
                            <a href='termek.php?termekid='$id'>  
                                <img src='$termekkep' class='product_img' />
                            </a> 
                        </td>
                    </tr>
                
                ";
            }

        ?>
    </table>
</div>

</body>
</html>
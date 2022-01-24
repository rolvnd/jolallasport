<?php require "header.php"; ?>

<div id="top">
    <img id="logo" src="img/logo.png" alt="">
    <?php require "menu.php"; ?>
</div>

<div id="left">
    <?php require "kategoria.php";  ?>
</div>

<div id="right">
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="#">Termékek keresése</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <form class="form-inline my-2 my-lg-0" autocomplete="off">
      <input class="form-control mr-sm-2" type="search" id="search" placeholder="Search" aria-label="Search">
    </form>
  </div>
</nav>
    <div class="col-md-5">
        <div id="result" class="list-group"></div>
    </div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.1/umd/popper.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>

    $(function(){

        $("#search").keyup(function(){

            var search = $("#search").val();

            if(search != ""){

                $.ajax({

                    url: "fetch.php",
                    method: "post",
                    data: {search:search},
                    success: function(data){

                        $("#result").html(data);
                    }
                })
            }
            else{

                $("#result").html("");
                
              
            }
        })
    })

</script>
</body>
</html>
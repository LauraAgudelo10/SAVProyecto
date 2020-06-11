<?php
require_once 'validarSesion.php'; 
require_once 'conexion.php';
$con = new Conexion();
$consulta = $con->conectar();
$consulta->set_charset("utf8");
?>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>SAV</title>
    <link rel="stylesheet" href="assets/css/style4.css">
    <link rel="stylesheet" href="assets/icon/style.css">

</head>
    <body>
        <header>
                <span class="lnr lnr-menu show"></span>
                <nav class="navegacion">
                    <ul class="menu">
                        <li><a href=""><?php echo $_SESSION["nombre"];?></a>
                            <ul class="submenu">
                                <li><a href="logout.php">Salir</a></li>
                            </ul>
                        </li>
                    </ul>
                </nav>
        </header>
        <main>
            
            <div class="content-menu">
                <a href="index.php"><li><span><img src="assets/img/4.png" width="40" height="40" alt=""><h4 class="text1">Inicio</h4></span></li></a>
            </div>


            <section class="cont1">
                    <div class="login-form1">
                        <section class="formulario-header1">
                            <div class="login-contenedor1">
                                <div class="login-form1">
                                    <form action="" method="post">
                                        <div class="form1"> 
                                            <label>Filtre su búsqueda</label>
                                            <input name="" type="text" placeholder="" id="buscador">
                                        </div>
                                            <div id="div1">
                                                <table class="table">
                                                    <thead class="">
                                                        <tr>
                                                            <th>FICHA</th>
                                                            <th>TRIMESTRE</th>
                                                            <th>INICIO ETAPA LECTIVA</th>
                                                            <th>FIN ETAPA LECTIVA</th>
                                                            <th>INICIO ETAPA PRODUCTIVA</th>
                                                            <th>FIN ETAPA PRODUCTIVA</th>
                                                            <th>VER</th>
                                                        </tr>
                                                    </thead><?php
                                                    if (isset($_GET['programa']) && !empty($_GET['programa'])) {
                                                                $exe = $consulta->query("select nombre from programasdeformacion where idprograma =". $_GET['programa']);
	                                                                $res = $exe->fetch_object();
	                                                                if ($res!="") { 
                                                                    $sql="call epractica.consulta(".$_GET['programa'].", 'p');"; 
                                                                    $exe = $consulta->query($sql);
                                                                while($res = $exe->fetch_row()){
                                                                echo '<tr>
                                                                    <td>'.$res->numficha.'</td>
                                                                    <td>'.$res[3].'</td>
                                                                    <td>'.$res[4].'</td>
                                                                    <td>'.$res[5].'</td>
                                                                    <td>'.$res[6].'</td>
                                                                    <td>'.$res[7].'</td>
                                                                    <td style="background: rgb(189, 226, 170); width:100px; height:30px;"><a href="ficha.php?numeroficha='.$res->numficha.'"><img src="assets/img/ver.png" width="20" height="20" alt=""></a></td>
                                                                  </tr>'; ?>
                                                            <?php 
                                                                         }
                                                                     }else{ ?>
                                                                <tbody id="resultados">
                                                                        <!-- Mostramos todos los resultados -->
                                                                </tbody><?php }
                                                            } else{ ?>
                                                        <tbody id="resultados">
                                                        <!-- Mostramos todos los resultados -->
                                                    </tbody>
                                                    <?php } ?>
                                                </table>
                                            </div>      
                                    </form>                         
                                </div>
                            </div>
                        </section>       
                    </div>
                </section>
        </main>
        <footer class="footer">
            <div class="contenedor-footer">
                <h4>&copy; SENA 2020 </h4>
            </div>
            <h2 class="titulo-final">&copy; Denisse Alejandra Alzate Meneses | Sergio León Saldarriaga Dávila | Laura Vanessa Agudelo Arias</h2>
        </footer>
        <script src="assets/js/jquery.js"></script>
        <script src="assets/js/popper.min.js"></script>
        <script src="assets/js/script.js"></script>
        <script src="assets/js/funcionesInfoPrograma.js"></script>
    </body>
</html>
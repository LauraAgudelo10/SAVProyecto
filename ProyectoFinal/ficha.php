<?php 
require_once 'validarSesion.php'; 
require_once 'conexion.php';
$con = new Conexion();
$consulta = $con->conectar();
$consulta->set_charset("utf8");

if (isset($_POST['submit']) && !empty($_POST['submit'])) {
    $al=$_POST['alternativa'];
    $id=$_POST['identificación'];
    $exe= $consulta->query("UPDATE `aprendiz` SET `idalternativa`=$al WHERE `identificacion` =$id");
}
?>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>SAV</title>
    <link rel="stylesheet" href="assets/css/style5.css">
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
                                                            <th>PROGRAMA DE FORMACIÓN</th>
                                                            <th>ALTERNATIVA</th>
                                                            <th>IDENTIFICACIÓN</th>
                                                            <th>NOMBRE</th>
                                                            <th>TELÉFONO</th>
                                                            <th>Modificar</th>
                                                        </tr>
                                                    </thead><?php 
                                                            if (isset($_GET['numeroficha']) && !empty($_GET['numeroficha'])) {
                                                                echo '
                                                                    <input type="hidden" id="variable" value="'.$_GET['numeroficha'].'">';
                                                                 $exe = $consulta->query("select numficha from ficha where numficha =". $_GET['numeroficha']);
                                                                    $res = $exe->fetch_object();                                                 
                                                                    if ($res!="") { 
                                                                    $sql="call epractica.consulta(".$_GET['numeroficha'].", 'f');"; 
                                                                    $exe = $consulta->query($sql);
                                                                while($res = $exe->fetch_object()){
                                                                echo '<tr>

                                                                    <td style=" width:110px;">'.$res->numficha.'</td>
                                                                    <td>'.$res->nombre.'</td>
                                                                    <td>'.$res->tipoalternativa.'</td>
                                                                    <td>'.$res->identificacion.'</td>
                                                                    <td>'.$res->nombreUsuario.'</td>
                                                                    <td style=" width:110px;">'.$res->telefono.'</td>
                                                                    <td style="background: rgb(189, 226, 170); width:100px; height:30px;"><a href="aprendiz.php?id='.$res->identificacion.'" style="text-decoration:none;"><img src="assets/img/edit.png" width="20" height="20" alt=""></a></td>
                                                                  </tr>' ?>
                                                            <?php 
                                                                    }
                                                            }else{ ?>
                                                    <tbody id="resultados">
                                                        <!-- Mostramos todos los resultados -->
                                                    </tbody><?php }
                                                            }else{ ?>
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
        <script src="assets/js/funcionesInfoFicha.js"></script>
    </body>
</html>
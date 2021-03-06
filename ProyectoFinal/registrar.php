<?php
require_once 'validarSesion.php'; 
?>

<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>SAV</title>
    <link rel="stylesheet" href="assets/css/style3.css">
    <link rel="stylesheet" href="assets/icon/style.css">
    <link rel="stylesheet" href="assets/css/con1.css">
    <link rel="stylesheet" href="assets/css/con2.css">
    <link rel="stylesheet" href="assets/css/con3.css">

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
                <a href="registrar.php"><li><span><img src="assets/img/5.png" width="50" height="50" alt=""><h4 class="text2">Registrar</h4></span></li></a>
            </div>


            <div class="article">
                <section class="contenido-header">
                    <section class="formulario-header">
                        <div class="login-contenedor">
                            <h1>Nuevo Usuario</h1>
                            <div class="login-form">
                                <form method="post" action="registro.php" >
                                    <div class="form">
                                        <label>Usuario</label>
                                            <input name="usuario" type="text" placeholder="Escriba nombre completo de usuario">
                                    </div>
                                    <div class="form"> 
                                        <label>Contraseña</label>
                                        <input name="clave" type="password" placeholder="Contraseña">
                                    </div>
                                    <input type="submit" value="REGISTRAR" name="accion" class="btn">
                                </form>                         
                            </div>
                        </div>
                    </section>
                </section>
            </div>

        </main>
        <footer class="footer">
            <div class="contenedor-footer">
                <h4>&copy; SENA 2020 </h4>
            </div>
            <h2 class="titulo-final">&copy; Denisse Alejandra Alzate Meneses | Sergio León Saldarriaga Dávila | Laura Vanessa Agudelo Arias</h2>
        </footer>
        <script src="assets/js/jquery.js"></script>
        <script src="assets/js/script.js"></script>
        <script src="assets/js/mostrar.js"></script>
    </body>
</html>
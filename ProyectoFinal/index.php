<?php
require_once 'validarSesion.php';  
?>

<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>SAV</title>
    <link rel="stylesheet" href="assets/css/style2.css">
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
                <li onclick="mostrar1()"><span><img src="assets/img/4.png" width="40" height="40" alt=""><h4 class="text1">Inicio</h4></span></li>
                <li onclick="mostrar2()"><span ><img src="assets/img/2.png"width="50" height="50" alt=""><h4 class="text2">Ficha</h4></span></li>
                <li onclick="mostrar3()"><span><img src="assets/img/1.png" width="50" height="50" alt=""><h4 class="text3">Programa</h4></span></li>
                <li onclick="mostrar4()"><span><img src="assets/img/3.png" width="50" height="50" alt=""><h4 class="text4">Aprendiz</h4></span></li>
                <a href="registrar.php"><li><span><img src="assets/img/5.png" width="50" height="50" alt=""><h4 class="text5">Registrar</h4></span></li></a>
            </div>


            <div class="article">
                
                <section id="inicio">
                    <div class="contenedor">
                        <img src="assets/img/inicio.jpg" width="100%" height="100%" text-aling="center" alt="">
                        <div class="texto-encima">BIENVENID@</div>
                        <div class="centrado">Sistema de Gestión Virtual de Aprendices</div>
                    </div>
                </section>

                <section class="cont1" id="ficha">
                    <img src="assets/img/SAV1.png" width="300" height="100" alt="">
                    <div class="login-form1">
                        <section class="formulario-header1">
                            <div class="login-contenedor1">
                                <h1>FICHA</h1>
                                <div class="login-form1">
                                    <form action="" method="post">
                                        <div class="form1"> 
                                            <label>Ingrese número de ficha</label>
                                            <input name="ficha" type="text" placeholder="#">
                                        </div>
                                        <button type="submit" class="btn1">Buscar</button>
                                    </form>                         
                                </div>
                            </div>
                        </section>       
                    </div>
                </section>

                <section class="cont2" id="programa">
                    <div class="logo">
                        <img src="assets/img/SAV1.png" width="300" height="100" alt="">
                    </div>
                    <div class="login-form2">
                        <section class="formulario-header2">
                            <div class="login-contenedor2">
                                <h1>PROGRAMA DE FORMACIÓN</h1>
                                <div class="login-form2">
                                    <form action="" method="post">
                                        <div class="form2"> 
                                            <label>Elija un programa de formación</label>
                                            <select name="usuario">
                                            <option value="0">Seleccionar un programa</option>
                                        </select>   
                                        </div>
                                        <button type="submit" class="btn2">Buscar</button>
                                    </form>                         
                                </div>
                            </div>
                        </section>       
                    </div>
                </section>

                <section class="cont3" id="aprendiz">
                    <img src="assets/img/SAV1.png" width="300" height="100" alt="">
                    <div class="login-form3">
                        <section class="formulario-header3">
                            <div class="login-contenedor3">
                                <h1>APRENDICES</h1>
                                <div class="login-form3">
                                    <form action="" method="post">
                                        <div class="form3"> 
                                            <label>Ingrese documento de aprendiz</label>
                                            <input name="ficha" type="text" placeholder="#">
                                        </div>
                                        <button type="submit" class="btn3">Buscar</button>
                                    </form>                         
                                </div>
                            </div>
                        </section>       
                    </div>
                </section>

                <section id="registrar">
                    <div class="logo">
                        <img src="assets/img/SAV1.png" width="300" height="100" alt="">
                    </div>
                    <h5>reg</h5>
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
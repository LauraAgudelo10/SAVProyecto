<?php
require_once 'validarSesion.php';  
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
                <a href="registrar.php"><li><span><img src="assets/img/1.png" width="50" height="38" alt=""><h4 class="text5">Registrar</h4></span></li></a>
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
                                                            <th>Ficha</th>
                                                            <th>Trimestre</th>
                                                            <th>Inicio de Etapa Lectiva</th>
                                                            <th>Fin de Etapa Lectiva</th>
                                                            <th>Inicio de Etapa Productiva</th>
                                                            <th>Fin de Etapa Productiva</th>
                                                            <th>Ver</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody id="resultados">
                                                        <!-- Mostramos todos los resultados -->
                                                    </tbody>
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
        <script src="assets/js/bootstrap.js"></script>
        <script src="assets/js/material.min.js"></script>
        <script src="assets/js/funcionesInfoPrograma.js"></script>
    </body>
</html>
<?php
require_once 'validarSesion.php';  
require_once 'conexion.php';
$con = new Conexion();
$consulta = $con->conectar();
$consulta->set_charset("utf8");
$res=$consulta->query("SELECT * FROM cadena order by nombreCadena "); 
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
                <li onclick="mostrar1()"><span><img src="assets/img/4.png" width="40" height="45" alt=""><h4 class="text1">Inicio</h4></span></li>
                <li onclick="mostrar2()"><span ><img src="assets/img/2.png"width="50" height="45" alt=""><h4 class="text2">Ficha</h4></span></li>
                <li onclick="mostrar3()"><span><img src="assets/img/1.png" width="50" height="45" alt=""><h4 class="text3">Programa</h4></span></li>
                <li onclick="mostrar4()"><span><img src="assets/img/3.png" width="50" height="45" alt=""><h4 class="text4">Aprendiz</h4></span></li>
                <a href="registrar.php"><li><span><img src="assets/img/5.png" width="50" height="45" alt=""><h4 class="text5">Registrar</h4></span></li></a>
            </div>


            <div class="article">
                
                <section id="inicio">
                    <div class="contenedor">
                        <img src="assets/img/inicio.jpg" width="100%" height="100%" text-aling="center" alt="">
                        <div class="texto-encima">BIENVENID@</div>
                        <div class="centrado">Sistema de Gestión Virtual de Aprendices</div>
                    </div>
                </section>

                 <!-- Contenedor de ficha -->
                <section class="cont1" id="ficha">
                    <div class="login-form1">
                        <section class="formulario-header1">
                            <div class="login-contenedor1">
                                <h1>FICHA</h1>
                                <div class="login-form1">
                                    <form action="ficha.php" method="post">
                                        <div class="form1"> 
                                            <label>Ingrese número de ficha</label>
                                            <input name="ficha" type="text" placeholder="#" id="buscador">
                                        </div>
                                            <div id="div1">
                                                <table id="resultados" >
                                                    <!-- muestra consulta -->
                                                </table>
                                            </div>      
                                    </form>                         
                                </div>
                            </div>
                        </section>       
                    </div>
                </section>

                <section class="cont2" id="programa">
                    <div class="login-form2">
                        <section class="formulario-header2">
                            <div class="login-contenedor2">
                                <h1>PROGRAMA DE FORMACIÓN</h1>
                                <div class="login-form2">
                                    <form action="programa.php" method="post">
                                        <div class="form2"> 
                                            <label>Elija un programa de formación</label>
                                            <select name="usuario" id="pais" onchange="cargarProgramas(this.value)">
                                                <option value="0" required>Seleccione una cadena de formación</option>
                                                
                                                <?php
                                                while($campos=$res->fetch_object()){
                                                ?>
                                                <option value="<?php echo $campos->idcadena;?>"><?php echo $campos->nombreCadena;?></option>
                                                <?php
                                                }
                                                ?>
                                            </select>
                                            <div id="cargarprograma">
                                               <select id="cargarprograma">                                               
                                                    <option value="0">Seleccione una un programa de formación</option>
                                                    <option value="0">Seleccione una cadena para continuar</option>
                                                </select>
                                                <button type="submit" class="btn2" disabled>Buscar</button>
                                            </div>   
                                        </div>
                                    </form>                         
                                </div>
                            </div>
                        </section>       
                    </div>
                </section>

                <section class="cont3" id="aprendiz">
                    <div class="login-form3">
                        <section class="formulario-header3">
                            <div class="login-contenedor3">
                                <h1>APRENDICES</h1>
                                <div class="login-form3">
                                    <form action="aprendiz.php" method="get">
                                        <div class="form3"> 
                                            <label name="id">Ingrese documento de aprendiz</label>
                                            <input name="id" type="number" placeholder="identificacion del aprendiz" required>
                                        </div>
                                        <button type="submit" class="btn3">Buscar</button>
                                    </form>                         
                                </div>
                            </div>
                        </section>       
                    </div>
                </section>
                
            </div>

        </main>
        <footer class="footer">
            <div class="contenedor-footer">
                <h4>&copy; SENA 2020 </h4>
            </div>
            <h2 class="titulo-final">&copy; Denisse Alejandra Alzate Meneses | Sergio León Saldarriaga Dávila | Laura Vanessa Agudelo Arias</h2>
        </footer>
        <script>
            function cargarProgramas(id){
            var xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function() {
              if (this.readyState == 4 && this.status == 200) {
               document.getElementById("cargarprograma").innerHTML = this.responseText;
              }
           };

            xhttp.open("GET", "cargarPrograma.php?idcadena="+id, true);
            xhttp.send();

          }
        </script>
        <script src="assets/js/jquery.js"></script>
        <script src="assets/js/script.js"></script>
        <script src="assets/js/mostrar.js"></script>
        <script src="assets/js/funcionesFicha.js"></script>
    </body>
</html>
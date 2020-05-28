
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>SAV</title>
    <link rel="stylesheet" href="assets/css/style6.css">
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
                <a href="aprendiz.php"><li><span><img src="assets/img/3.png" width="50" height="38" alt=""><h4 class="text5">Aprendiz</h4></span></li></a>
            </div>

             
            <section class="content-form">

                <h2 class="sub-title">DATOS GENERALES</h2>

                <form action="" method="" id="registrar-form" >
                  
                    <div class="form-group width-12">
                         <div class="width-6">
                          <input type="text" placeholder="Ficha *" class="form-control" name="ficha" id="numficha" /> <hr>
                         </div> 
                         <div class="width-6">
                          <input type="text" placeholder="Programa *" class="form-control" name="programa" id="prog" /> <hr>
                         </div>  
                    </div>

                    <div class="form-group">
                         <div class="width-12">
                            <input type="text" placeholder="Nombre *" class="form-control" name="nombre" id="nombre" /> <hr class="hr1">
                         </div>
                    </div>
                      
                     <div class="form-group width-12">
                         <div class="width-6">
                          <input type="text" placeholder="Identificación *" class="form-control" name="identificación" id="identificación" /> <hr>
                         </div> 
                         <div class="width-6">
                          <input type="text" placeholder="Teléfono *" class="form-control" name="telefono" id="telefono" /> <hr>
                         </div>  
                     </div>
                        
                    <div class="alt form-group width-6"> 
                        <h4>Alternativa</h4>
                        <select name="usuario" id="pais" onchange="">
                            <option value="0" required>Alternativa</option>
                        </select>
                    </div>          
                     <br>
                     <div class="form-group width-12">
                            <input type="submit" value="REGISTRAR" class="form-control btn btn-principal" id="btn-registrar"/>
                             
                     </div>
              
                </form>

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
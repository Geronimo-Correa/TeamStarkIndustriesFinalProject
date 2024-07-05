<?php

    require 'conexion.php';

        if(!empty($_POST['titulo']) && !empty($_POST['clasificacion']) && !empty($_POST['agno']) && !empty($_POST['director']) && !empty($_POST['duracion']) && !empty($_POST['descripcion']) && !empty($_POST['generos']) && !empty($_POST['url'])){    
            $titulo = $_POST['titulo'];
            $clasificacion = $_POST['clasificacion'];
            $agno = $_POST['agno'];
            $director = $_POST['director'];
            $duracion = $_POST['duracion'];
            $descripcion = $_POST['descripcion'];
            $generos = $_POST['generos'];
            $url = $_POST['url'];

            $query = "INSERT INTO seriesypeliculas(titulo, clasificacion, año, director, duracion,descripcion, generos, url) VALUES('$titulo','$clasificacion','$agno','$director','$duracion','$descripcion','$generos','$url')";

            $execute = mysqli_query($conn,$query);
        }
    

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ADMINISTRADOR | CAC-Series</title>
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
    <link rel="stylesheet" href="/assets/styleAdministracion.css">
    <link rel="icon" href="/assets/carrete-de-pelicula.ico">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:ital,opsz,wght@0,6..12,200..1000;1,6..12,200..1000&family=Nunito:ital,wght@0,200..1000;1,200..1000&display=swap" rel="stylesheet">

    <script src="https://kit.fontawesome.com/875021797f.js" crossorigin="anonymous"></script>

</head>

<body>

    <header class="header">
        <div class="logo">
            <a>
                <img src="/assets/carrete-de-pelicula.png" alt="logoPagina">
                <div class="pagName">
                    <h2>CAC-Series</h2>
                </div>
            </a>
        </div>
    </header>

    <main>
        <section class="contenedor-form" data-aos="zoom-in-up" data-aos-offset="300" data-aos-delay="50" data-aos-duration="800">
            <form method="POST" action="administracion.php">
                <h2 class="tituloRegistrar">Nueva Carga 🌐</h2>
                <div class="contenedor-input">
                    <input type="text" name="titulo" placeholder="Título" required>
                </div>

                <div class="contenedor-input">
                    <select name="clasificacion" required>
                        <option disabled selected>Clasificaciones</option>
                        <option value="AA">AA (Comprensible para menores de 7 años)</option>
                        <option value="A">A (Para todo público)</option>
                        <option value="B">B (+12 años)</option>
                        <option value="B15">B15 (No recomendada para menores de 15 años)</option>
                        <option value="C">C (+18 años)</option>
                    </select>
                </div>

                <div class="contenedor-input">

                    <?php
                        $cont = date('Y');
                    ?>
                    
                    <select name="agno" required>
                        <option disabled selected>Año</option>
                        <?php while ($cont >= 1950) { ?>
                            <option value="<?php echo($cont); ?>"> <?php echo($cont); ?></option>
                        <?php $cont = ($cont-1); }?>
                    </select>                    
                </div>

                <div class="contenedor-input">
                    <input type="text" name="director" placeholder="Director o Estudio" required>
                </div>

                <div class="contenedor-input">
                    <input type="number" name="duracion" placeholder="Duración en minutos" required>
                </div>

                <div class="contenedor-input">
                    <input type="text" name="descripcion" placeholder="Descripción" required>
                </div>

                <div class="contenedor-input">
                    <select name="generos" required>
                        <option disabled selected>Géneros</option>
                        <option value="Accion">Accion</option></option>
                        <option value="Aventura">Aventura</option>
                        <option value="Autos">Autos</option>
                        <option value="Comedia">Comedia</option>
                        <option value="Demonios">Demonios</option>
                        <option value="Misterio">Misterio</option>
                        <option value="Drama">Drama</option>
                        <option value="Fantasia">Fantasia</option>
                        <option value="Juegos">Juegos</option>
                        <option value="Historico">Historico</option>
                        <option value="Terror">Terror</option>
                        <option value="Magia">Magia</option>
                        <option value="Artes Marciales">Artes Marciales</option>
                        <option value="Mecha">Mecha</option>
                        <option value="Musica">Musica</option>
                        <option value="Samurai">Samurai</option>
                        <option value="Romance">Romance</option>
                        <option value="Sci-Fi">Sci-Fi</option>
                        <option value="Deportes">Deportes</option>
                        <option value="Super Poderes">Super Poderes</option>
                        <option value="Vampiros">Vampiros</option>
                        <option value="Sobrenatural">Sobrenatural</option>
                        <option value="Militar">Militar</option>
                        <option value="Policial">Policial</option>
                        <option value="Psicologico">Psicologico</option>
                        <option value="Isekai">Isekai</option>
                    </select>
                </div>

                <div class="contenedor-input">
                    <input type="url" name="url" placeholder="URL Trailer" required>
                </div>

                <div class="contenedor-input">
                    <button class="btnForm" valu="agregar">Agregar</button>
                </div>
            </form>
        </section>
    </main>    

    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>

    <script>
        AOS.init();
    </script>

</body>
</html>
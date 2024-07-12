<?php 
    require '../Secciones/conexion.php';
    
    if(!empty($_GET['codigo'])){
        $codigo = $_GET['codigo'];
        $eliminar = mysqli_query($conn, "DELETE FROM seriesYpeliculas WHERE id = $codigo");
        if($eliminar == 1){
            echo'
                <script>
                    window.location = "../Secciones/administracion.php";
                </script>
                ';
            
        }else{
            echo'
                <script>
                    alert("Error al eliminar");
                </script>
                ';
        }
    }

?>
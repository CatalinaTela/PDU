<div class="container is-fluid">
    <h1 class="title">Home</h1>
    <h2 class="subtitle">¡Bienvenido!
        <?php //echo $_SESSION['nombre']." ".$_SESSION['apellido']; ?>
    </h2>
</div>

<!-- Incluir el catálogo -->
<?php include "./backend/object/catalogo_parcial.php"; ?>

<div class="container pb-6 pt-6">
    <?php
        require_once "././backend/php/main.php";

        if(!isset($_GET['page'])){
            $pagina=1;
        }else{
            $pagina=(int) $_GET['page'];
            if($pagina<=1){
                $pagina=1;
            }
        }

        $id_operation = (isset($_GET['id_operation'])) ? $_GET['id_operation'] : 0;
        $id_type = (isset($_GET['id_type'])) ? $_GET['id_type'] : 0;

        $pagina=limpiar_cadena($pagina);
        $url="index.php?vista=catalogo&page="; /* <== */
        $registros=12;
        $busqueda="";

        require_once "././backend/object/Property.php";
    ?>
</div>
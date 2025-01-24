<?php
    require_once "../php/main.php";

    // Obtener ID de propiedad de manera segura
    $id = isset($_POST['id_property']) ? limpiar_cadena($_POST['id_property']) : 0;

    // Validar que el ID sea un número
    if (!is_numeric($id)) {
        $id = 0;
    }

    $check_propiedad = conexion();
    $check_propiedad = $check_propiedad->query("SELECT * FROM propiedades WHERE id_property='$id'");

    if ($check_propiedad->rowCount() == 1) {
        $datos = $check_propiedad->fetch();
        $images = json_decode($datos['picture'], true) ?: []; // Si no existen imágenes, inicializa un array vacío
    } else {
        echo '<div class="notification is-danger is-light">¡Error! La propiedad no existe.</div>';
        exit();
    }
    
 ?>
    
    
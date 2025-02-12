<?php  
    $inicio = ($pagina > 0) ? (($pagina * $registros) - $registros) : 0;
    $cuadricula = ""; 

    $campos = "propiedades.id_property, propiedades.title, propiedades.description, propiedades.observations, propiedades.ubication, propiedades.value, propiedades.picture, propiedades.id_operation, propiedades.id_type, operacion_inmobiliaria.id_operation, operacion_inmobiliaria.operation_name, tipo_propiedad.id_type, tipo_propiedad.type_name";
    


    $consulta_datos = "SELECT $campos 
    FROM propiedades 
    INNER JOIN operacion_inmobiliaria ON propiedades.id_operation = operacion_inmobiliaria.id_operation 
    INNER JOIN tipo_propiedad ON propiedades.id_type = tipo_propiedad.id_type 
    WHERE 1=1"; // El "1=1" facilita agregar condiciones dinámicas

    $consulta_total = "SELECT COUNT(propiedades.id_property) 
        FROM propiedades 
        INNER JOIN operacion_inmobiliaria ON propiedades.id_operation = operacion_inmobiliaria.id_operation 
        INNER JOIN tipo_propiedad ON propiedades.id_type = tipo_propiedad.id_type 
        WHERE 1=1"; // El "1=1" facilita agregar condiciones dinámicas

    $id_operation = isset($_GET['id_operation']) ? intval($_GET['id_operation']) : 0;
    $id_type = isset($_GET['id_type']) ? intval($_GET['id_type']) : 0;

    // Condiciones dinámicas
    if (!empty($busqueda)) {
    $consulta_datos .= " AND (propiedades.title LIKE '%$busqueda%' 
                OR propiedades.description LIKE '%$busqueda%' 
                OR propiedades.observations LIKE '%$busqueda%' 
                OR propiedades.ubication LIKE '%$busqueda%' 
                OR propiedades.value LIKE '%$busqueda%' 
                OR tipo_propiedad.type_name LIKE '%$busqueda%' 
                OR operacion_inmobiliaria.operation_name LIKE '%$busqueda%')";

    $consulta_total .= " AND (propiedades.title LIKE '%$busqueda%' 
                    OR propiedades.description LIKE '%$busqueda%' 
                    OR propiedades.observations LIKE '%$busqueda%' 
                    OR propiedades.ubication LIKE '%$busqueda%' 
                    OR propiedades.value LIKE '%$busqueda%' 
                    OR tipo_propiedad.type_name LIKE '%$busqueda%' 
                    OR operacion_inmobiliaria.operation_name LIKE '%$busqueda%')";
    }

    if (isset($id_operation) && $id_operation > 0) {
    $consulta_datos .= " AND propiedades.id_operation = $id_operation";
    $consulta_total .= " AND propiedades.id_operation = $id_operation";
    }

    if (isset($id_type) && $id_type > 0) {
    $consulta_datos .= " AND propiedades.id_type = $id_type";
    $consulta_total .= " AND propiedades.id_type = $id_type";
    }

    // Agregar filtro de precio
    $price_min = isset($_GET['price_min']) ? floatval($_GET['price_min']) : 0;
    $price_max = isset($_GET['price_max']) ? floatval($_GET['price_max']) : 300000;

    // Agregar condiciones a las consultas
    if ($price_min > 0 || $price_max < 300000) {
        $consulta_datos .= " AND propiedades.value BETWEEN $price_min AND $price_max";
        $consulta_total .= " AND propiedades.value BETWEEN $price_min AND $price_max";
    }


    // Ordenar y limitar resultados
    $consulta_datos .= " ORDER BY propiedades.title ASC LIMIT $inicio, $registros";


    //Conexion
    $conexion = conexion();

    $datos = $conexion->query($consulta_datos);
    $datos = $datos->fetchAll();

    $total = $conexion->query($consulta_total);
    $total = (int) $total->fetchColumn();

    $Npaginas = ceil($total / $registros);

    // Define las variables $pag_inicio y $pag_final si hay registros y la página está en el rango válido
    if ($total >= 1 && $pagina <= $Npaginas) {
        $pag_inicio = $inicio + 1;
        $pag_final = $inicio + count($datos);
    }

    // Encabezado de la cuadrícula HTML
    $cuadricula = '<div class="columns is-multiline is-centered">'; // Inicia la cuadrícula con soporte para múltiples líneas y centrado

    // Recorrido de los datos y generación de celdas para la cuadrícula
    foreach ($datos as $rows) {
        $pictures = json_decode($rows['picture'], true);
        $fotoPath = is_file($pictures[0]) 
            ? $pictures[0] 
            : './assets/img/logo.jpg';
    
        $cuadricula .= '
        <div class="column is-12-mobile is-6-tablet is-4-desktop is-3-widescreen"> <!-- Responsividad -->
            <div class="card">
                <div class="card-image">
                    <figure class="image is-4by3">
                        <img src="'.$fotoPath.'" alt="Foto" >
                    </figure>
                </div>                
                <header class="card-header">
                    <p class="card-header-title">' . strtoupper($rows['title']) . '</p>
                </header>
                <div class="card-content">
                    <div class="content">
                        <p><strong>Valor:</strong> USD ' . number_format($rows['value'], 2) . '</p>
                        <p><strong>Tipo:</strong> ' . $rows['type_name'] . '</p>
                        <p><strong>Operación:</strong> ' . $rows['operation_name'] . '</p>
                        <p><strong>Ubicación:</strong> ' . $rows['ubication'] . '</p>
                    </div>
                </div>
                <footer class="card-footer">
                    <a href="index.php?vista=publicacion&id_property_view=' . $rows['id_property'] . '" class="card-footer-item">Ver más</a>
                    <a href="index.php?vista=guardar_favorito&id_property=' . $rows['id_property'] . '" class="card-footer-item">Guardar</a>
                </footer>  
            </div>
        </div>';
    }
    
    $cuadricula .= '</div>'; // Cierre de las columnas
    

    // Mostrar mensaje si no hay registros
    if ($total < 1) {
        $cuadricula = '<p class="has-text-centered">No hay registros en el sistema</p>';
    } elseif ($total >= 1 && $pagina <= $Npaginas) {
        $cuadricula .= '<p class="has-text-right">Mostrando propiedades <strong>' . $pag_inicio . '</strong> al <strong>' . $pag_final . '</strong> de un <strong>total de ' . $total . '</strong></p>';
    }

    // Cierre de la conexión y salida de la cuadrícula
    $conexion = null;
    echo $cuadricula;

    // Mostrar paginador si es necesario
    if ($total >= 1 && $pagina <= $Npaginas) {
        echo paginador_tablas($pagina, $Npaginas, $url, 7);
    }
?>
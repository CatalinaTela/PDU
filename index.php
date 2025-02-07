<?php
ob_start(); // Inicia el búfer de salida
require "./backend/inc/session_start.php";
?>
<!doctype html>
<html lang="es">
    <head>
        <?php include "./backend/inc/head.php"; ?>
    </head>
    <body>
        <div class="main-content">
            <?php
            // Establecer vista por defecto
            if (!isset($_GET['vista']) || $_GET['vista'] == "") {
                $_GET['vista'] = "home_public"; // Vista pública por defecto
            }

            // Permitir rutas con símbolos seguros
            $vista = preg_replace('/[^a-zA-Z0-9_\/]/', '', $_GET['vista']); // Limpiar caracteres peligrosos

            // Lista de vistas públicas (accesibles sin sesión)
            $vistas_publicas = ["home_public", "login", "registro_publico", "404", "about_us", "catalogo", "contacto", "inmobiliarias", "publicacion"];

            // Verificar si la vista es pública
            if (in_array($vista, $vistas_publicas)) {
                $vista_ruta = "./views/{$vista}.php";
                include "./backend/inc/navbar_public.php"; // Navbar público
            } else {
                // Verificar si el usuario tiene una sesión activa
                if (!isset($_SESSION['id']) || $_SESSION['id'] == "") {
                    // Redirigir al login si no está autenticado
                    header("Location: index.php?vista=login");
                    exit();
                }
                if ($vista == 'logout') {
                    include './views/logout.php'; // Ruta correcta al archivo logout
                    exit();
                }

                // Determinar carpeta según rol
                if (isset($_SESSION['role']) && $_SESSION['role'] == "admin") {
                    $vista_ruta = "./views/admin/{$vista}.php"; // Vistas de admin
                    include "./backend/inc/navbar.php"; // Navbar de admin
                } else {
                    $vista_ruta = "./views/{$vista}.php"; // Vistas de usuario
                    include "./backend/inc/navbar_public.php"; // Navbar público (o uno específico para usuarios)
                }
            }

            // Comprobar si el archivo existe
            if (is_file($vista_ruta)) {
                include $vista_ruta;
                include "./backend/inc/script.php";
            } else {
                include "./views/404.php";
            }
            ?>
        </div>
        <!-- Incluir el footer -->
        <?php include('./backend/inc/footer.php'); ?>
    </body>
</html>
<?php ob_end_flush(); // Finaliza y limpia el búfer de salida ?>
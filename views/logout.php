<?php
session_start(); // Iniciar la sesión
session_destroy(); // Destruir la sesión

// Redirigir al login en la carpeta raíz
header("Location: index.php?vista=login");
exit();
?>
<?php
    require_once "./backend/php/main.php";

    if (!isset($_SESSION['id'])) {
        header("Location: index.php?vista=login");
        exit();
    }

    if (isset($_GET['id_property'])) {
        $id_property = intval($_GET['id_property']);
        $id_user = $_SESSION['id'];

        $conexion = conexion();
        $stmt = $conexion->prepare("DELETE FROM favoritos WHERE id_user = :id_user AND id_property = :id_property");
        $stmt->bindParam(':id_user', $id_user, PDO::PARAM_INT);
        $stmt->bindParam(':id_property', $id_property, PDO::PARAM_INT);

        if ($stmt->execute()) {
            header("Location: index.php?vista=favoritos&success=1");
        } else {
            header("Location: index.php?vista=favoritos&error=1");
        }
    } else {
        header("Location: index.php?vista=favoritos");
    }
?>
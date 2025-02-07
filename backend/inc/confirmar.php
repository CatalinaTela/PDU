<?php
require_once "main.php";

if (isset($_GET['token'])) {
    $token = limpiar_cadena($_GET['token']);

    // Buscar el token en la tabla de usuarios_pendientes
    $conexion = conexion();
    $query = $conexion->prepare("SELECT * FROM usuarios_pendientes WHERE token = :token");
    $query->bindParam(':token', $token);
    $query->execute();

    if ($query->rowCount() > 0) {
        $usuario = $query->fetch(PDO::FETCH_ASSOC);

        // Mover los datos a la tabla de usuarios
        $query_insert = $conexion->prepare("
            INSERT INTO usuarios (name, lastname, mail, password, phone, role) 
            VALUES (:nombre, :apellido, :email, :clave, :telefono, 'user')
        ");
        $query_insert->bindParam(':nombre', $usuario['name']);
        $query_insert->bindParam(':apellido', $usuario['lastname']);
        $query_insert->bindParam(':email', $usuario['mail']);
        $query_insert->bindParam(':clave', $usuario['password']);
        $query_insert->bindParam(':telefono', $usuario['phone']);

        if ($query_insert->execute()) {
            // Eliminar el registro pendiente
            $query_delete = $conexion->prepare("DELETE FROM usuarios_pendientes WHERE id = :id");
            $query_delete->bindParam(':id', $usuario['id']);
            $query_delete->execute();

            echo '
                <div class="notification is-info is-light">
                    <strong>¡Registro confirmado!</strong><br>
                    Ahora puedes iniciar sesión.
                </div>
            ';
        } else {
            echo '
                <div class="notification is-danger is-light">
                    <strong>¡Ocurrió un error inesperado!</strong><br>
                    No se pudo confirmar el registro.
                </div>
            ';
        }
    } else {
        echo '
            <div class="notification is-danger is-light">
                <strong>¡Token inválido o expirado!</strong><br>
                Por favor, regístrate nuevamente.
            </div>
        ';
    }
} else {
    echo '
        <div class="notification is-danger is-light">
            <strong>¡Token no proporcionado!</strong><br>
            Por favor, utiliza el enlace de confirmación enviado a tu correo.
        </div>
    ';
}
?>
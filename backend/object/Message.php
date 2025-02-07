<?php
// Conexión a la base de datos
require_once './backend/php/main.php';

// Incluir PHPMailer
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

require '././assets/src/Exception.php';
require '././assets/src/PHPMailer.php';
require '././assets/src/SMTP.php';

// Obtener listado de inmobiliarias
$conexion = conexion();
$query_inmobiliarias = $conexion->prepare("SELECT id_agency, name_agency, mail_agency FROM inmobiliarias");
$query_inmobiliarias->execute();
$inmobiliarias = $query_inmobiliarias->fetchAll(PDO::FETCH_ASSOC);

// Verificar si se envió el formulario
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Capturar y limpiar los datos del formulario
    $name = limpiar_cadena($_POST['name'] ?? '');
    $phone = limpiar_cadena($_POST['phone'] ?? '');
    $email = filter_var($_POST['email'] ?? '', FILTER_SANITIZE_EMAIL);
    $subject = limpiar_cadena($_POST['subject'] ?? '');
    $message = limpiar_cadena($_POST['message'] ?? '');

    // Validar datos
    $errors = [];
    if (empty($name)) $errors[] = "El nombre es obligatorio.";
    if (empty($email) || !filter_var($email, FILTER_VALIDATE_EMAIL)) $errors[] = "El email no es válido.";
    if (empty($message)) $errors[] = "El mensaje es obligatorio.";

    if (empty($errors)) {
        // Guardar en la base de datos
        $query = $conexion->prepare("
            INSERT INTO mensajes_contacto (name, phone, email, subject, message) 
            VALUES (:name, :phone, :email, :subject, :message)
        ");
        $query->bindParam(':name', $name);
        $query->bindParam(':phone', $phone);
        $query->bindParam(':email', $email);
        $query->bindParam(':subject', $subject);
        $query->bindParam(':message', $message);

        if ($query->execute()) {
            $success = "Mensaje guardado con éxito.";

            // Enviar correo con PHPMailer
            $mail = new PHPMailer(true);

            try {
                // Configuración del servidor SMTP
                $mail->isSMTP();
                $mail->Host = 'smtp.gmail.com'; // Servidor SMTP de Gmail
                $mail->SMTPAuth = true;
                $mail->Username = 'tela.catalina@gmail.com'; // Tu correo
                $mail->Password = 'oqde ljzb wmuh bvvj'; // Tu contraseña
                $mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS; // Habilitar TLS
                $mail->Port = 587; // Puerto SMTP

                // Destinatarios
                $mail->setFrom('tela.catalina@gmail.com', 'Inmobiliaria Mail');
                $mail->addAddress('tela.catalina@gmail.com'); // Correo de destino

                // Contenido del correo
                $mail->isHTML(true);
                $mail->Subject = 'Nuevo mensaje de contacto';
                $mail->Body = "
                    <h1>Nuevo mensaje de contacto</h1>
                    <p><strong>Nombre:</strong> $name</p>
                    <p><strong>Teléfono:</strong> $phone</p>
                    <p><strong>Email:</strong> $email</p>
                    <p><strong>Asunto:</strong> $subject</p>
                    <p><strong>Mensaje:</strong> $message</p>
                ";

                $mail->send();
                $success .= " Se ha enviado un correo con la consulta.";
            } catch (Exception $e) {
                $errors[] = "Error al enviar el correo: {$mail->ErrorInfo}";
            }
        } else {
            $errors[] = "Ocurrió un error al guardar el mensaje. Inténtalo de nuevo.";
        }
    }
}
?>
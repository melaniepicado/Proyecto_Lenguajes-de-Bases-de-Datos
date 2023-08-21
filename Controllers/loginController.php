<?php
include_once '../Models/loginModel.php';

if (session_status() == PHP_SESSION_NONE) {
    session_start();
}

if (isset($_POST["btnIniciarSesion"])) {
    $correoElectronico = $_POST["correoElectronico"];
    $contrasenna = $_POST["contrasenna"];

    $resultado = ValidarInicioSesionModel($correoElectronico, $contrasenna);

    if ($resultado) {
        $datosResultado = oci_fetch_assoc($resultado);

        $_SESSION["idEmpleado"] = $datosResultado["ID_EMPLEADO"]; // Reemplaza "ID_EMPLEADO" con el nombre real de la columna
        $_SESSION["Correo"] = $datosResultado["CORREO"]; // Reemplaza "CORREO" con el nombre real de la columna
        // Resto de las asignaciones de sesión...

        if ($datosResultado["NOMBRE_ROL"] == 'Bodeguero') {
            header("location: ../Views/productoInformacion.php");
        } else {
            header("location: ../Views/ventas.php?nombreProducto=");
        }
    } else {
        header("location: ../Views/login.php");
    }

    // Limpieza de variables de sesión (observa que aquí está incorrecto en tu código original)
    $_SESSION["Identificacion"] = "";
    $_SESSION["CorreoCliente"] = "";
    $_SESSION["Nombre"] = "";
    $_SESSION["Telfono"] = "";
    $_SESSION["idCliente"] = "";
    $_SESSION["Factura"] = "";
    $_SESSION["Carrito"] = [];
}
?>

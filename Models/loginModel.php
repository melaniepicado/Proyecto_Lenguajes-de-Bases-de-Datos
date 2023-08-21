<?php
include_once 'conexion.php';

function ValidarInicioSesionModel($correoElectronico, $contrasenna) {
    $instancia = Open();

    $sentencia = "SELECT * FROM tu_tabla WHERE correo = '$correoElectronico' AND contrasenna = '$contrasenna'";
    $resultado = oci_parse($instancia, $sentencia);
    oci_execute($resultado);

    return $resultado;
}

?>
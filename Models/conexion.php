<?php

/*function Open()
{
    $servidor = "127.0.0.1:3306";
    $usuario = "root";
    $contrasenna = "";
    $baseDatos = "proyecto_supermercado_la_amistad";

    return mysqli_connect($servidor, $usuario, $contrasenna, $baseDatos);
}

function Close($instancia)
{
    mysqli_close($instancia);
}*/

function Open() {
    $usuario = 'Mlaken302528';
    $contrasena = '302528';
    $servidor = 'orcl'; // Ejemplo: 'localhost/XE' para la edición Express de Oracle
    $puerto = '1521'; // Por lo general, el puerto predeterminado es 1521

    $conexion = oci_connect($usuario, $contrasena, "$servidor:$puerto");
    if (!$conexion) {
        $error = oci_error();
        trigger_error(htmlentities($error['Esta conexión no fue establecida correctament'], ENT_QUOTES), E_USER_ERROR);
    }

    return $conexion;
}

function Close($conexion) {
    oci_close($conexion);
}

?>
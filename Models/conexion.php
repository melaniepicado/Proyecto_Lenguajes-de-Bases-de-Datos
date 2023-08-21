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
    $base_de_datos = 'ORCL'; // Puede ser el nombre de la instancia o el servicio en tu tnsnames.ora
    $host = 'localhost'; // Por lo general, localhost o el nombre de la máquina

    $instancia = oci_connect($usuario, $contrasena, "$host/$base_de_datos");
    if (!$instancia) {
        $error = oci_error();
        trigger_error(htmlentities($error['Esta conexión no fue establecida correctament'], ENT_QUOTES), E_USER_ERROR);
    }

    return $instancia;
}

function Close($instancia) {
    oci_close($instancia);
}

?>
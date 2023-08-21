<?php
function Open() {
    $usuario = 'Mlaken302528'; // Cambia esto al usuario correcto
    $contraseña = '302528'; // Cambia esto a la contraseña correcta
    $base_de_datos = 'ORCL'; // Cambia esto al nombre de la instancia o servicio en tu tnsnames.ora
    $host = 'localhost'; // Cambia esto al host correcto

    // Intenta establecer la conexión
    $conn = oci_connect($usuario, $contraseña, "$host/$base_de_datos");

    if (!$conn) {
        $e = oci_error();
        trigger_error(htmlentities($e['message'], ENT_QUOTES), E_USER_ERROR);
    }

    return $conn;
}

function Close($conn) {
    oci_close($conn);
}

function GetEmpleados($conn) {
    $sql = "SELECT * FROM tb_empleado";

    $stid = oci_parse($conn, $sql);
    oci_execute($stid);

    $result = array();
    while ($row = oci_fetch_assoc($stid)) {
        $result[] = $row;
    }

    oci_free_statement($stid);

    return $result;
}

// Abre la conexión
$conn = Open();

// Obtiene los empleados
$empleados = GetEmpleados($conn);

// Cierra la conexión
Close($conn);

// Imprime los empleados
print_r($empleados);
?>
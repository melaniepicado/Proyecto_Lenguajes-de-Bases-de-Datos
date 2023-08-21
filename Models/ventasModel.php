<?php
include_once 'conexion.php';

function BuscarDatosClienteModel($idCliente)
{
    $instancia = Open();

    $sentencia = "BEGIN BuscarDatosCliente(:idCliente, :resultado); END;";
    $resultado = oci_parse($instancia, $sentencia);

    oci_bind_by_name($resultado, ':idCliente', $idCliente);

    oci_bind_by_name($resultado, ':resultado', $resultadoCursor, -1, OCI_B_CURSOR);

    oci_execute($resultado);
    oci_execute($resultadoCursor);

    Close($instancia);
    return $resultadoCursor;
}
function BuscarProductoModel($nombreProducto)
{
    $instancia = Open();

    // Crear una variable para almacenar el cursor resultante
    $resultadoCursor = oci_new_cursor($instancia);

    // Crear la sentencia SQL con el procedimiento almacenado
    $sentencia = "BEGIN BuscarProducto(:nombreProducto, :resultado); END;";
    $resultado = oci_parse($instancia, $sentencia);

    // Enlazar los parámetros
    oci_bind_by_name($resultado, ':nombreProducto', $nombreProducto);
    oci_bind_by_name($resultado, ':resultado', $resultadoCursor, -1, OCI_B_CURSOR);

    // Ejecutar la consulta
    oci_execute($resultado);

    // Abrir y ejecutar el cursor resultante
    oci_execute($resultadoCursor);

    // Cerrar la conexión
    Close($instancia);

    return $resultadoCursor;
}


function VerTotalFacturaModel($idFactura)
{
    $instancia = Open();

    $sentencia = "BEGIN VerTotalFactura(:idFactura, :resultado); END;";
    $resultado = oci_parse($instancia, $sentencia);

    $idFacturaParam = $idFactura;
    $resultadoCursor = oci_new_cursor($instancia);

    oci_bind_by_name($resultado, ':idFactura', $idFacturaParam);
    oci_bind_by_name($resultado, ':resultado', $resultadoCursor, -1, OCI_B_CURSOR);

    oci_execute($resultado);
    oci_execute($resultadoCursor);

    Close($instancia);
    return $resultadoCursor;
}

function AgregarProductoModel($idProducto, $Cantidad, $idFactura)
{
    $instancia = Open();

    $sentencia = "BEGIN AgregarProducto(:idProducto, :Cantidad, :idFactura); END;";
    $resultado = oci_parse($instancia, $sentencia);

    oci_bind_by_name($resultado, ':idProducto', $idProducto);
    oci_bind_by_name($resultado, ':Cantidad', $Cantidad);
    oci_bind_by_name($resultado, ':idFactura', $idFactura);

    oci_execute($resultado);

    Close($instancia);
    return $resultado;
}

function CrearFacturaModel($idCliente, $idEmpleado)
{
    $instancia = Open();

    $sentencia = "BEGIN CrearFactura(:idCliente, :idEmpleado, :idFactura); END;";
    $resultado = oci_parse($instancia, $sentencia);

    oci_bind_by_name($resultado, ':idCliente', $idCliente);
    oci_bind_by_name($resultado, ':idEmpleado', $idEmpleado);
    oci_bind_by_name($resultado, ':idFactura', $idFactura, -1, SQLT_INT);

    oci_execute($resultado);

    Close($instancia);
    return $idFactura;
}




function EliminarCarritoTotalModel($idFactura) {
    $instancia = Open();

    $sentencia = "BEGIN EliminarFactura(:idFactura); END;";
    $resultado = oci_parse($instancia, $sentencia);

    // Crear una variable para el cursor de resultado
    $resultadoCursor = oci_new_cursor($instancia);

    oci_bind_by_name($resultado, ':idFactura', $idFactura);

    // Ejecuta la llamada al procedimiento
    oci_execute($resultado);

    Close($instancia);
    return $resultadoCursor;
}



function EliminarProductoModel($idProducto, $Cantidad, $Factura) {
    $instancia = Open();

    $sentencia = "BEGIN EliminarProducto(:idProducto, :Cantidad, :Factura); END;";
    $resultado = oci_parse($instancia, $sentencia);

    oci_bind_by_name($resultado, ':idProducto', $idProducto);
    oci_bind_by_name($resultado, ':Cantidad', $Cantidad);
    oci_bind_by_name($resultado, ':Factura', $Factura);

    oci_execute($resultado);

    Close($instancia);
    return $resultado;
}

function VerComprasModel() {
    $instancia = Open();

    $sentencia = "BEGIN VerCompras(:resultado); END;";
    $resultado = oci_parse($instancia, $sentencia);

    oci_bind_by_name($resultado, ':resultado', $resultadoCursor, -1, OCI_B_CURSOR);

    oci_execute($resultado);
    oci_execute($resultadoCursor);

    Close($instancia);
    return $resultadoCursor;
}

function VerDetalleCompraModel($idCompra)
{
    $instancia = Open();

    $sentencia = "BEGIN VerDetalleCompra(:idCompra, :resultado); END;";
    $resultado = oci_parse($instancia, $sentencia);

    oci_bind_by_name($resultado, ':idCompra', $idCompra);
    oci_bind_by_name($resultado, ':resultado', $resultadoCursor, -1, OCI_B_CURSOR);

    oci_execute($resultado);
    oci_execute($resultadoCursor);

    Close($instancia);

    return $resultadoCursor;
}








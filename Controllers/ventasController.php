<?php
include_once '../Models/ventasModel.php';

if (session_status() == PHP_SESSION_NONE) {
    session_start();
}

if (isset($_POST["btnBuscarCliente"])) {

    $identificacion = $_POST['identificacion'];
    if ($_SESSION["Factura"] == "") {
        $resultado = BuscarDatosClienteModel($identificacion);
        if (oci_num_rows($resultado) > 0) {
            $datosResultado = oci_fetch_assoc($resultado);
            $_SESSION["Identificacion"] = $identificacion;
            $_SESSION["CorreoCliente"] = $datosResultado["CORREO"];
            $_SESSION["Nombre"] = $datosResultado["NOMBRE"];
            $_SESSION["Telfono"] = $datosResultado["TELEFONO"];
            $_SESSION["idCliente"] = $datosResultado["IDCLIENTE"];
        } else {
            $_SESSION["Identificacion"] = "";
            $_SESSION["CorreoCliente"] = "";
            $_SESSION["Nombre"] = "";
            $_SESSION["Telfono"] = "";
            $_SESSION["idCliente"] = "";
            $_SESSION["Factura"] = "";
            header("location: ../Views/clientesinformacion.php");
        }
    }
}

function BuscarProducto($nombreProducto)
{
    $resultadoCursor = BuscarProductoModel($nombreProducto);

    if ($resultadoCursor) {
        $numRows = oci_fetch_all($resultadoCursor, $datosResultados, null, null, OCI_FETCHSTATEMENT_BY_ROW);

        if ($numRows > 0) {
            foreach ($datosResultados as $datosResultado) {
                // ... Mostrar los detalles del producto en la interfaz web ...
            }
        } else {
            echo "No se encontraron productos.";
        }

        oci_free_statement($resultadoCursor); // Liberar el cursor
    } else {
        echo "Error al buscar productos.";
    }
}

function TotalFactura()
{
    $idFactura = $_SESSION["Factura"];
    $total = VerTotalFacturaModel($idFactura);

    return $total;
}


if (isset($_POST["AgregarProducto"])) {
    if ($_SESSION["Factura"] == "") {
        $resultadoFactura = CrearFacturaModel($_SESSION["idCliente"], $_SESSION["idEmpleado"]);
        if ($resultadoFactura > 0) {
            $_SESSION["Factura"] = $resultadoFactura;
        }
    }
    if ($_POST['cantidad'] <= $_POST['CantidadDisponible'] && $_POST['cantidad'] > 0) {
        $resultadoProducto = AgregarProductoModel($_POST['idProducto'], $_POST['cantidad'], $_SESSION["Factura"]);
        if ($resultadoProducto) {
            echo "ok";
        }
    }else
    {
        echo "Cantidad no disponible";
    }
}

if (isset($_POST["EliminarProducto"])) {

    $resultadoProducto = EliminarProductoModel($_POST['idProducto'], $_SESSION["Factura"], $_POST['Cantidad']);
    if ($resultadoProducto) {
        echo "ok";
    }
}




function VerDetalleFacturaModel($idFactura)
{
    $instancia = Open();

    // Crear una variable para almacenar el cursor resultante
    $resultadoCursor = oci_new_cursor($instancia);

    // Crear la sentencia SQL con el procedimiento almacenado
    $sentencia = "BEGIN VerDetalleFactura(:idFactura, :resultado); END;";
    $resultado = oci_parse($instancia, $sentencia);

    // Enlazar los parámetros
    oci_bind_by_name($resultado, ':idFactura', $idFactura);
    oci_bind_by_name($resultado, ':resultado', $resultadoCursor, -1, OCI_B_CURSOR);

    // Ejecutar la consulta
    oci_execute($resultado);

    // Abrir y ejecutar el cursor resultante
    oci_execute($resultadoCursor);

    // Cerrar la conexión
    Close($instancia);

    return $resultadoCursor;
}





function VerDetalleFactura()
{
    $resultado = VerDetalleFacturaModel($_SESSION["Factura"]);
    if (oci_num_rows($resultado) > 0) {
        return $resultado;
    } else {
        return null;
    }
}

function VerCompras()
{   
    $resultado = VerComprasModel();

    if(oci_num_rows($resultado) > 0)
    {
        while ($datosResultado = oci_fetch_assoc($resultado))
        {   
            echo "<tr>";
            echo "<td>" . $datosResultado["FECHA_FACTURA"] . "</td>";
            echo "<td>" . $datosResultado["CLIENTE"] . "</td>";
            echo "<td>" . $datosResultado["EMPLEADO"] . "</td>";
            echo "<td>" . "<a href='../Views/detalles.php?id_Compra=" . $datosResultado["ID_COMPRA"] . "'>Ver Detalle</a> </td>";
            echo "</tr>";
        }
       
    }
}
function VerDetalleCompra($idCompra)
{
    $resultado = VerDetalleCompraModel($idCompra);
    
    if ($resultado) {
        $Totalizado = 0;
        
        while ($datosResultado = oci_fetch_assoc($resultado)) {
            $Totalizado += ($datosResultado["CANTIDAD_VENTA"] * $datosResultado["PRECIO_VENTA"]);
            echo "<tr>";
            echo "<td>" . $datosResultado["CANTIDAD_VENTA"] . "</td>";
            echo "<td>" . $datosResultado["NOMBRE_PRODUCTO"] . "</td>";
            echo "<td>" . $datosResultado["PRECIO_VENTA"] . "</td>";
            echo "<td>" . ($datosResultado["CANTIDAD_VENTA"] * $datosResultado["PRECIO_VENTA"]) . "</td>";
            echo "</tr>";
        }
        
        echo "<tr>";
        echo "<td style='color:blue; text-align:right; font-weight:bold;' colspan='4'>Total a Pagar: $" . number_format($Totalizado, 2) . "</td>";
        echo "</tr>";
        
        oci_free_statement($resultado);
    } else {
        echo "No se encontraron detalles de compra.";
    }
}

?>
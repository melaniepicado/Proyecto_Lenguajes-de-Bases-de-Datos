function BuscarNombreApi() {

    let identificacion = $("#identificacion").val().trim();

    $.ajax({
        url: 'https://apis.gometa.org/cedulas/' + identificacion,
        type: 'GET',
        datatype : 'json',
        success: function (res) {
          
            $("#nombre").val(res.nombre);

        }
    });

}

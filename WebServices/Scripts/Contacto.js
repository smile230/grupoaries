

$(document).on('click', '#buscarContacto', function (e) {
    e.preventDefault();
    var data = {
        IdZoho: $("#IdZoho").val()
    };

    $.ajax({
        type: "POST",
        url: "./ObtenerContacto",
        contentType: "application/json",
        dataType: "json",
        data: JSON.stringify(data),
        success: function (res) {            
            $("#Apellido_Materno").val(res.Apellido_Materno);
            $("#Average_Time_Spent_Minutes").val(res.Average_Time_Spent_Minutes);
            $("#Ciudad_de_correspondencia").val(res.Ciudad_de_correspondencia);
            $("#Codigo_de_Pais").val(res.Codigo_de_Pais);
            $("#codigo_sincronizacion").val(res.codigo_sincronizacion);
            $("#colonia_para_correspondencia").val(res.colonia_para_correspondencia);
            $("#Cuenta_con_Metodo_de_Pago_Comprobable").val(res.Cuenta_con_Metodo_de_Pago_Comprobable);
            $("#CURP").val(res.CURP);
            $("#Currency").val(res.Currency);
            $("#Date_of_Birth").val(res.Date_of_Birth);
            $("#Days_Visited").val(res.Days_Visited);
            $("#Department").val(res.Department);
            $("#Description").val(res.Description);
            $("#Domicilio_para_recibir_notificaciones").val(res.Domicilio_para_recibir_notificaciones);
            $("#Duplicidad_localizada_en").val(res.Duplicidad_localizada_en);
            $("#Edad").val(res.Edad);
            $("#Email").val(res.Email);
            $("#Email_Opt_Out").val(res.Email_Opt_Out);
            $("#Estado_Civil").val(res.Estado_Civil);
            $("#Exchange_Rate").val(res.Exchange_Rate);
            $("#Fax").val(res.Fax);
            $("#First_Name").val(res.First_Name);
            $("#First_Visited_Time").val(res.First_Visited_Time);
            $("#First_Visited_URL").val(res.First_Visited_URL);
            $("#Full_Name").val(res.Full_Name);
            $("#Home_Phone").val(res.Home_Phone);
            $("#ID_de_Expediente").val(res.ID_de_Expediente);
            $("#Last_Name").val(res.Last_Name);
            $("#Last_Visited_Time").val(res.Last_Visited_Time);
        },

    });
});


function GuardarContacto() {
    var frmContacto = document.getElementById("FrmContacto");
    var frm = new FormData(frmContacto);
    fetch("./GuardarContacto", {
        method: "POST",
        body: frm
    }).then(res => res.text())
    .then(res => {
        if (res > 0) console.log("Registro guardado correctamente. Folio: " + res.toString());
    });
}


function ActualizarContacto() {    
    
    var data = {
            IdZoho:$("#IdZoho").val(),
            Apellido_Materno: $("#Apellido_Materno").val(),
            Average_Time_Spent_Minutes: $("#Average_Time_Spent_Minutes").val(),
            Ciudad_de_correspondencia: $("#Ciudad_de_correspondencia").val(),
            Codigo_de_Pais: $("#Codigo_de_Pais").val(),
            codigo_sincronizacion: $("#codigo_sincronizacion").val(),
            colonia_para_correspondencia: $("#colonia_para_correspondencia").val(),
            Cuenta_con_Metodo_de_Pago_Comprobable: $("#Cuenta_con_Metodo_de_Pago_Comprobable").val(),
            CURP: $("#CURP").val(),
            Currency: $("#Currency").val(),
            Date_of_Birth: $("#Date_of_Birth").val(),
            Days_Visited: $("#Days_Visited").val(),
            Department :$("#Department").val(),
            Description: $("#Description").val(),
            Domicilio_para_recibir_notificaciones: $("#Domicilio_para_recibir_notificaciones").val(),
            Duplicidad_localizada_en: $("#Duplicidad_localizada_en").val(),
            Edad: $("#Edad").val(),
            Email: $("#Email").val(),
            Email_Opt_Out: $("#Email_Opt_Out").val(),
            Estado_Civil: $("#Estado_Civil").val(),
            Exchange_Rate: $("#Exchange_Rate").val(),
            Fax: $("#Fax").val(),
            First_Name: $("#First_Name").val(),
            First_Visited_Time: $("#First_Visited_Time").val(),
            First_Visited_URL: $("#First_Visited_URL").val(),
            Full_Name: $("#Full_Name").val(),
            Home_Phone: $("#Home_Phone").val(),
            ID_de_Expediente: $("#ID_de_Expediente").val(),
            Last_Name: $("#Last_Name").val(),
            Last_Visited_Time: $("#Last_Visited_Time").val()        
    };

    $.ajax({
        type: "POST",
        url: "./ActualizarContacto",
        dataType: "json",
        success: function (res) {
            alert(res);
        },
        data: { Contacto: data}
    });
    
}

function Cancelar() {
    window.location.href = '/';
}


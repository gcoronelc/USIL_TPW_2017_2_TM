// Validacion del inicio de sesión
$("#btn_acceder").on("click",function(){
    $("#frm_login").validate({		
	rules: {
		txt_usuario:{
			required: true
		},
		txt_clave:{
			required: true
		}
	},
	messages: {
		txt_usuario:{
			required: "<p class='box_error'><i class='fa fa-exclamation-triangle'></i> Ingrese su cuenta.</p>"
		},
		txt_clave:{
			required: "<p class='box_error'><i class='fa fa-exclamation-triangle'></i> Ingrese su contraseña.</p>",
			password: true
		}
	}
   });    
});




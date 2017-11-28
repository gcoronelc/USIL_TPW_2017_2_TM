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

$("#btn_signup").on("click",function(){
    $("#frm_signup").validate({
        rules:{
            txt_nombres:{
                required: true             
            },
            txt_apellidos:{
                required: true
            },
            cbo_tipo:{
                required:true  
            },
            num_doc:{
                digits: true,
                required: true,
                maxlength: 11,
                minlength: 8
            },
            txt_usuario:{
                required: true,
                minlength: 8
            },
            txt_clave:{
                required: true,
                minlength: 8
            },
            confirm_clave:{
                required: true,
                minlength: 8,
                equalTo: "#txt_clave"
            },
            txt_email:{
                required: true,
                email: true
            }
        },
        messages:{
            txt_nombres:{
                required: "<p class='box_error'><i class='fa fa-exclamation-triangle'></i> Ingrese su nombre completo.</p>"
            },
            txt_apellidos:{
                required: "<p class='box_error'><i class='fa fa-exclamation-triangle'></i> Ingrese su apellido completo.</p>"
            },
            cbo_tipo:{
                required: "<p class='box_error'><i class='fa fa-exclamation-triangle'></i> Seleccione un tipo de documento.</p>"
            },
            num_doc:{
                digits: "<p class='box_error'><i class='fa fa-exclamation-triangle'></i> Ingrese solo números.</p>",
                required: "<p class='box_error'><i class='fa fa-exclamation-triangle'></i> Ingrese el número de documento</p>",
                maxlength: "<p class='box_error'><i class='fa fa-exclamation-triangle'></i> Solo se ingresa máx 12 dígitos.</p>",
                minlength: "<p class='box_error'><i class='fa fa-exclamation-triangle'></i> Debe ingresarse mínimo 8 dígitos.</p>"
            },
            txt_usuario:{
                required: "<p class='box_error'><i class='fa fa-exclamation-triangle'></i> Ingrese su cuenta de usuario</p>",
                minlength:"<p class='box_error'><i class='fa fa-exclamation-triangle'></i> Debe ingresarse mínimo 8 dígitos.</p>"
            },
            txt_clave:{
                required: "<p class='box_error'><i class='fa fa-exclamation-triangle'></i> Ingrese su contraseña</p>",
                minlength: "<p class='box_error'><i class='fa fa-exclamation-triangle'></i> Debe ingresarse mínimo 8 dígitos.</p>"
            },
            confirm_clave:{
                required: "<p class='box_error'><i class='fa fa-exclamation-triangle'></i> Ingrese nuevamente su contraseña</p>",
                minlength: "<p class='box_error'><i class='fa fa-exclamation-triangle'></i> Debe ingresarse mínimo 8 dígitos.</p>",
                equalTo: "<p class='box_error'><i class='fa fa-exclamation-triangle'></i> Contraseñas no coinciden.</p>" 
            },
            txt_email:{
                required: "<p class='box_error'><i class='fa fa-exclamation-triangle'></i> Ingrese su email.</p>",
                email: "<p class='box_error'><i class='fa fa-exclamation-triangle'></i> Email no válido.</p>"
            }
        }
    });
});


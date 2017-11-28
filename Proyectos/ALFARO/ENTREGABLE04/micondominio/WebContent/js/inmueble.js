// Buscar libro
$('#btn_buscarinm').on("click", function(){
    $('#frm_buscarinm').validate({
        rules:{
            busca_nombre:{
                required: true 
            }
        },
        errorPlacement: function(error,element) {
            return true;
        }
    });
});

// Limpiar formulario al cancelar el modal
$('#btn_cancelar').on('click', function () {
    var $form = $('#frm_nuevoinm');
    $form.find("input,textarea,select").val("");
    $form.validate().resetForm();
    $form.find('.error').removeClass('error');
});

// Insertar nuevo libro
$("#btn_grabar").on("click",function(){
	$("#frm_nuevoinm").validate({
		rules:{
			cbo_edificio:{
				required: true		
			},
			txt_nombre:{
				required: true
			},
			nro_piso:{
				required: true,
                digits: true
			}
		},
		messages:{
			cbo_edificio :{
				required: "<p class='box_error'><i class='fa fa-exclamation-triangle'></i> Seleccione el edificio donde se encuentra el inmueble.</p>"
			},
			txt_nombre :{
				required: "<p class='box_error'><i class='fa fa-exclamation-triangle'></i> Ingrese el nombre del inmueble.</p>"
			},
			nro_piso :{
				required: "<p class='box_error'><i class='fa fa-exclamation-triangle'></i> Ingrese el n° de piso del edificio donde se encuentra el inmueble.</p>",
                digits: "<p class='box_error'><i class='fa fa-exclamation-triangle'></i> Ingrese solo números.</p>"
			}
		}
	});
});

// Editar libro
$("#btn_editar").on("click",function(){
	$("#frm_editarinm").validate({
        		rules:{
			cbo_edificio:{
				required: true		
			},
			txt_nombre:{
				required: true
			},
			nro_piso:{
				required: true,
                digits: true
			}
		},
		messages:{
			cbo_edificio :{
				required: "<p class='box_error'><i class='fa fa-exclamation-triangle'></i> Seleccione el edificio donde se encuentra el inmueble.</p>"
			},
			txt_nombre :{
				required: "<p class='box_error'><i class='fa fa-exclamation-triangle'></i> Ingrese el nombre del inmueble.</p>"
			},
			nro_piso :{
				required: "<p class='box_error'><i class='fa fa-exclamation-triangle'></i> Ingrese el n° de piso del edificio donde se encuentra el inmueble.</p>",
                digits: "<p class='box_error'><i class='fa fa-exclamation-triangle'></i> Ingrese solo números.</p>"
			}
		}
	});
});

// Eliminar propietario 
$("#btn_eliminar").on("click",function (){
    swal({
      title: '¿Estás seguro?',
      text: "Si continuas no podrás recuperar el inmueble",
      type: 'warning',
      showCancelButton: true,
      cancelButtonText: 'Cancelar',
      confirmButtonColor: '#ef4c4c',
      cancelButtonColor: '#3085d6',
      confirmButtonText: '<i class="fa fa-trash"></i> Continuar',
      closeOnConfirm: false, 
      closeOnCancel: false,
      allowOutsideClick: false,
      allowEscapeKey: false,      
      allowEnterKey: false
    }).then(function () {
      swal(
        'Eliminado!',
        'El <strong>inmueble</strong> ha sido eliminado.',
        'success'
      )
    })
});
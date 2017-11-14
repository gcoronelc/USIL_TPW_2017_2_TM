// Buscar libro
$('#btn_buscarcli').on("click", function(){
    $('#frm_buscarcli').validate({
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
    var $form = $('#frm_nuevocli');
    $form.find("input").val("");
    $form.validate().resetForm();
    $form.find('.error').removeClass('error');
});

// Insertar nuevo libro
$("#btn_grabar").on("click",function(){
	$("#frm_nuevocli").validate({
		rules:{
			txt_nombre:{
				required: true		
			},
			ape_paterno:{
				required: true
			},
			ape_materno:{
				required: true
			},
			txt_dni:{
				required: true,
                digits:true
			}
		},
		messages:{
			txt_nombre :{
				required: "<p class='box_error'><i class='fa fa-exclamation-triangle'></i> Ingrese nombre completo.</p>"
			},
			ape_paterno :{
				required: "<p class='box_error'><i class='fa fa-exclamation-triangle'></i> Ingrese el apellido paterno.</p>"
			},
			ape_materno :{
				required: "<p class='box_error'><i class='fa fa-exclamation-triangle'></i> Ingrese el apellido materno.</p>"
			},
			txt_dni :{
				required: "<p class='box_error'><i class='fa fa-exclamation-triangle'></i> Ingrese el número de DNI.</p>",
                digits: "<p class='box_error'><i class='fa fa-exclamation-triangle'></i> Ingrese solo números.</p>"
			}
		}
	});
});

// Editar libro
$("#btn_editar").on("click",function(){
	$("#frm_editarcli").validate({
        rules:{
			txt_nombre:{
				required: true		
			},
			ape_paterno:{
				required: true
			},
			ape_materno:{
				required: true
			},
			txt_dni:{
				required: true,
                digits:true
			}
		},
		messages:{
			txt_nombre :{
				required: "<p class='box_error'><i class='fa fa-exclamation-triangle'></i> Ingrese nombre completo.</p>"
			},
			ape_paterno :{
				required: "<p class='box_error'><i class='fa fa-exclamation-triangle'></i> Ingrese el apellido paterno.</p>"
			},
			ape_materno :{
				required: "<p class='box_error'><i class='fa fa-exclamation-triangle'></i> Ingrese el apellido materno.</p>"
			},
			txt_dni :{
				required: "<p class='box_error'><i class='fa fa-exclamation-triangle'></i> Ingrese el número de DNI.</p>",
                digits: "<p class='box_error'><i class='fa fa-exclamation-triangle'></i> Ingrese solo números.</p>"
			}
		}
	});
});

// Eliminar propietario 
$("#btn_eliminar").on("click",function (){
    swal({
      title: '¿Estás seguro?',
      text: "Si continuas no podrás recuperar al cliente",
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
        'El <strong>cliente</strong> ha sido eliminado.',
        'success'
      )
    })
});
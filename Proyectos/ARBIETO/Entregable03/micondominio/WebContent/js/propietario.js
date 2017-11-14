// Buscar libro
$('#btn_buscarprop').on("click", function(){
    $('#frm_buscarprop').validate({
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
    var $form = $('#frm_nuevoprop');
    $form.find("input,textarea,select,file").val("");
    $form.validate().resetForm();
    $form.find('.error').removeClass('error');
});

// Insertar nuevo 
$("#btn_grabar").on("click",function(){
	$("#frm_nuevoprop").validate({
		rules:{
			cbo_persona:{
				required: true		
			},
			cbo_inmueble:{
				required: true
			},
			dt_inicio:{
				required: true,				
				date: true
			},
			dt_fin:{
				required: true,
                date:true
			},
		},
		messages:{
			cbo_persona :{
				required: "<p class='box_error'><i class='fa fa-exclamation-triangle'></i> Seleccione a un cliente registrado.</p>"
			},
			cbo_inmueble :{
				required: "<p class='box_error'><i class='fa fa-exclamation-triangle'></i> Seleccione un inmueble registrado.</p>"
			},
			dt_inicio :{
				required: "<p class='box_error'><i class='fa fa-exclamation-triangle'></i> Ingrese la fecha.</p>",
				date: "<p class='box_error'><i class='fa fa-exclamation-triangle'></i> Inserte solo fecha.</p>"
			},
			dt_fin :{
				required: "<p class='box_error'><i class='fa fa-exclamation-triangle'></i> Ingrese la fecha.</p>",
                date: "<p class='box_error'><i class='fa fa-exclamation-triangle'></i> Inserte solo fecha.</p>"
			}
		}
	});
});

// Editar libro
$("#btn_editar").on("click",function(){
	$("#frm_editarprop").validate({
		rules:{
			cbo_persona:{
				required: true		
			},
			cbo_inmueble:{
				required: true
			},
			dt_inicio:{
				required: true,				
				date: true
			},
			dt_fin:{
				required: true,
                date:true
			}
		},
		messages:{
			cbo_persona :{
				required: "<p class='box_error'><i class='fa fa-exclamation-triangle'></i> Seleccione a un cliente registrado.</p>"
			},
			cbo_inmueble :{
				required: "<p class='box_error'><i class='fa fa-exclamation-triangle'></i> Seleccione un inmueble registrado.</p>"
			},
			dt_inicio :{
				required: "<p class='box_error'><i class='fa fa-exclamation-triangle'></i> Ingrese la fecha.</p>",
				date: "<p class='box_error'><i class='fa fa-exclamation-triangle'></i> Inserte solo fecha.</p>"
			},
			dt_fin :{
				required: "<p class='box_error'><i class='fa fa-exclamation-triangle'></i> Ingrese la fecha.</p>",
                date: "<p class='box_error'><i class='fa fa-exclamation-triangle'></i> Inserte solo fecha.</p>"
			}
		}
	});
});

// Eliminar propietario 
$("#btn_eliminar").on("click",function (){
    swal({
      title: '¿Estás seguro?',
      text: "Si continuas no podrás recuperar al propietario",
      type: 'warning',
      showCancelButton: true,
      cancelButtonText: 'Cancelar',
      confirmButtonColor: '#ef4c4c',
      cancelButtonColor: '#3085d6',
      confirmButtonText: '<i class="fa fa-trash"></i> Continuar',
      closeOnConfirm: false, //It does close the popup when I click on close button
      closeOnCancel: false,
      allowOutsideClick: false,
      allowEscapeKey: false,      
      allowEnterKey: false
    }).then(function () {
      swal(
        'Eliminado!',
        'El <strong>propietario</strong> ha sido eliminado.',
        'success'
      )
    })
});
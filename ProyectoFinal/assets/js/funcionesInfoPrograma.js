$(infoPrograma());

function infoPrograma(parametro){

	$.ajax({
		url: '../ProyectoFinal/infoprograma.php',
		type: 'POST',
		data: { info: parametro },
	})
	.done(function(tabla){
		$('#resultados').html(tabla);
		console.log(tabla);
	})
}

$(document).on('keyup', '#buscador', function(){
	var valorBuscar = $(this).val();

	if(valorBuscar !="") {
		infoPrograma(valorBuscar);
	}else{
		infoPrograma();
	}
})
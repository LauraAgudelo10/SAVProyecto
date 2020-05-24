$(listaFicha());

function listaFicha(parametro){

	$.ajax({
		url: '../ProyectoFinal/listaficha.php',
		type: 'POST',
		data: { dato: parametro },
	})
	.done(function(tabla){
		$('#resultados').html(tabla);
		console.log(tabla);
	})
}

$(document).on('keyup', '#buscador', function(){
	var valorBuscar = $(this).val();

	if(valorBuscar !="") {
		listaFicha(valorBuscar);
	}else{
		listaFicha();
	}
})
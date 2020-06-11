$(infoFicha());

function infoFicha(parametro){
	var ficha = document.getElementById("variable").value;
	var parametro = parametro +'&ficha='+ficha;
	
$.ajax({
		url: '../ProyectoFinal/infoficha.php',
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
		infoFicha(valorBuscar);
	}else{
		infoFicha();
	}
})
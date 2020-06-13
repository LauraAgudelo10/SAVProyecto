$(infoPrograma());

function infoPrograma(parametro){
var programa = document.getElementById("variable").value;
	$.ajax({
		url: '../ProyectoFinal/infoprograma.php',
		type: 'POST',
		data: { info: parametro, programas : programa },
	})
	.done(function(tabla){
		$('#resultados').html(tabla);
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
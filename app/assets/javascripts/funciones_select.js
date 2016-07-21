function limpiar_select(select)
{
  var s=document.getElementById(select);
  s.options.length = 0;
  s.options[0]=new Option("","");
}
function limpiar_todos_select()
{

	//limpiar_select("municipios");
	limpiar_select("centros_salud");
	limpiar_select("comunidades");
}

function comunidad()
{
	var s_provincia=document.getElementById("provincia").value;
	var s_municipio=document.getElementById("municipios").value;
	var s_centros_salud=document.getElementById("centros_salud").value;

	var datos=provincias[s_provincia];

	datos=datos[s_municipio];
	datos=datos[s_centros_salud];
	
	var select_2=document.getElementById("comunidades");	
	fill_select(datos,select_2);
}
function centros_salud()
{

	var s_provincia=document.getElementById("provincia").value;
	var s_municipio=document.getElementById("municipios").value;
	var datos=provincias[s_provincia];
	datos=datos[s_municipio];
	var select_2=document.getElementById("centros_salud");
	if (s_municipio == "") {
		limpiar_select("comunidades");
	}
	fill_select(datos,select_2);
}

function cargar_municipios()
{

	var s_provincia=document.getElementById("provincia").value;
	var datos=provincias[s_provincia];	
	var select_2=document.getElementById("municipios");
	fill_select(datos,select_2);
	limpiar_todos_select();
}
/*function fill_select(datos,select_2)
{
	console.log("dafsfd2222");
	var i=1;
	select_2.options.length = 0;
	select_2.options[0]=new Option("","");

	for (var item in datos)
	{
		if (item!='tf_IndexByValue')
		{
			console.log("asfdasfdasfas2");
			select_2.options[i]=new Option(item,item);
			i=i+1;
		}
	}
}*/
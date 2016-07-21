//onkeyup="controlFechaKeyUp('paciente_fecha_nacimiento')" onchange="controlFechaOnChange('paciente_fecha_nacimiento')"
function controlFechaKeyUp(id_fecha)
{
     var objeto_fecha = document.getElementById(id_fecha);
     objeto_fecha.value=stringfechaActual();
    }
function controlFechaOnChange(id_fecha)
{
  var objeto_fecha = document.getElementById(id_fecha);
  fecha_actual=new Date(stringfechaActual());
  fecha_evaluar=new Date(objeto_fecha.value);
  if (objeto_fecha.value=="") {
    objeto_fecha.value=stringfechaActual();
  }
  if (fecha_evaluar>fecha_actual) {
    objeto_fecha.value=stringfechaActual();
  }
}
function stringfechaActual()
{
  var fecha_actual=new Date();
  return fecha_actual.getFullYear()+ "-" +agregrarCero(fecha_actual.getMonth()+1)+"-"+agregrarCero(fecha_actual.getDate());
}
function agregrarCero(numero)
{
  if (numero<10)
    return '0'+numero;
  return numero;
}
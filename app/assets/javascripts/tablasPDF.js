  var columnas;
  var filas;
function ltrim(str, filter) {
  var i = str.length;
  filter || ( filter = '' );
  for (var k = 0; k < i && filtering(str.charAt(k), filter); k++);
  return str.substring(k, i);
}
function rtrim(str, filter) {
  filter || ( filter = '' );
  for (var j = str.length - 1; j >= 0 && filtering(str.charAt(j), filter); j--);          
  return str.substring(0, j + 1);
}
function trim(str, filter) {
  filter || ( filter = '' );
  return ltrim(rtrim(str, filter), filter);
}
function filtering(charToCheck, filter) {
  filter || ( filter = " \t\n\r\f" );
  return (filter.indexOf(charToCheck) != -1);
}

  function tabla_columnas(tabla,estado_tabla)
  {
    estado = estado_tabla || false;
    columnas=new Array();
    var dimesionColumnas;
    var dimensionFilas=tabla.rows.length;

    
    if (estado==true) {
      dimesionColumnas=tabla.rows[1].cells.length;

         }
    else{
           dimesionColumnas=tabla.rows[1].cells.length-1;

    }
    console.log("Columna");
    console.log(dimesionColumnas);
    console.log(tabla);
      for (var j = 0; j <dimesionColumnas; j++) {
        console.log(tabla.rows[1].cells[j].innerHTML);
        columnas[j]=tabla.rows[1].cells[j].innerHTML;
      }
  }
  function tabla_filas(tabla,estado_tabla)
  {
    estado = estado_tabla || false;
    filas=new Array();
    var dimensionFilas=tabla.rows.length;
    var dimesionColumnas;
    var celdas;

    var indice=0;
        for (var i = 2; i < dimensionFilas; i++) {
          
            if (estado==true) {
                dimesionColumnas=tabla.rows[i].cells.length;

                   }
              else{
                     dimesionColumnas=tabla.rows[i].cells.length-1;

              }
              if (tabla.rows[i].style.display!="none") 
              {
                f=new Array();
                for (var j = 0; j <dimesionColumnas; j++) {
                     f[j]=trim(cadena(tabla.rows[i].cells[j].innerHTML));
                }
                filas[indice]=f;
                indice=indice+1;
              }
        }
  }
  function cadena(letra)
  {
      dimension=letra.length;
      cadena2="";
      if (letra.charAt(0)=="<") {
        for (var i = 22; i < dimension; i++) {
          if (letra.charAt(i)=="<") {
            return cadena2;
          }
          cadena2=cadena2+letra.charAt(i);
        }
      }
      else
      {
       return letra+"";
     }
  }
  function demoFromHTML1(estado_tabla) {

    var tabla=document.getElementById("tabla");
    tabla_columnas(tabla,estado_tabla);
    tabla_filas(tabla,estado_tabla);

    // Only pt supported (not mm or in)
    var doc = new jsPDF('p', 'pt');
    doc.autoTable(columnas, filas);
    doc.save('table.pdf');
 /*
    var pdf = new jsPDF('p', 'pt', 'letter');
    var width=20;
    pdf.cellInitialize();
    pdf.setFontSize(10);
    pdf.cell(10, 50, "hola".length, 30, "hola", 10);
    $.each( $('#tabla tr'), function (i, row){
        $.each( $(row).find("td, th"), function(j, cell){

            var txt = $(cell).text().trim()+"adad" || " ";
            var width = (j==4) ? 40 : 70; //make 4th column smaller
            console.log($(cell).style);
            pdf.cell(10, 50, width, 30, txt, i);
        });
    });

    pdf.save('sample-file.pdf');*/
}
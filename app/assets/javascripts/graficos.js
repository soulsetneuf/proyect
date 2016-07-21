var array_meses=new Array();
array_meses[0]="Enero";
array_meses[1]="	Febrero";
array_meses[2]="Marzo";
array_meses[3]="Abril";
array_meses[4]="Mayo";
array_meses[5]="Junio";
array_meses[6]="Julio";
array_meses[7]="Agosto";
array_meses[8]="Septiembre";
array_meses[9]="Octubre";
array_meses[10]="Noviembre";
array_meses[11]="Diciembre";
function retornar_array(array,meses)
{
   var datos = array;
   var lista_meses = meses || false;
   console.log(array);
   var elArray = new Array();
   for (var i = 0; i < datos.length; i++) 
   {
      if(lista_meses==false)
      {
         elArray[i]={'label':datos[i].label,'value':datos[i].value};
      }
      else
      {
         elArray[i]={'label':
         lista_meses[getMes(datos[i].label)-1],'value':datos[i].value};
      }
   }
   return elArray;
}
function getMes(dato)
{
  var mes=dato.substring(5,7);
  console.log(parseInt(mes));
  return parseInt(mes);
}
function grafico_columna(contenedor,titulo,subtitulo,titulo_ejex,titulo_ejey,datos)
{
       var revenueChart = new FusionCharts({
        type: 'column2d',
        renderAt: contenedor,
        width: '500',
        height: '300',
        dataFormat: 'json',
        dataSource: {
            "chart": {
                "caption": titulo,
                "subCaption": subtitulo,
                "xAxisName": titulo_ejex,
                "yAxisName": titulo_ejey,
                //Making the chart export enabled in various formats
                "exportEnabled" :"1",
                "numberPrefix": "",
                "theme": "fint"
            },

            "data": retornar_array(datos,array_meses)
        }
    });

    revenueChart.render();
}
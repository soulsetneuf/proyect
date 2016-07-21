var provincias=new Array();
var centro_salud_t=new Array();
var comunidad_t=new Array();
var municipio_t=new Array();


comunidad_t['Aguas Calientes']='Aguas Calientes';
comunidad_t['Sull kari']='Sull kari';
centro_salud_t['Tinguipaya']=comunidad_t;
municipio_t['Tinguipaya']=centro_salud_t;
provincias['Tomas Frias']=municipio_t;



var comunidades_yura=new Array();
var centros_salud_yura=new Array();
var municipios_tomave=new Array();
comunidades_yura["Rio Abajo"]="Rio Abajo";
comunidades_yura["Chocala"]="Chocala";
comunidades_yura["Rio Laico"]="Rio Laico";
centros_salud_yura['Yura']=comunidades_yura;
municipios_tomave['Tomave']=centros_salud_yura;
provincias['A. Quijarro']=municipios_tomave;


//////////////////////////////////////////////////////////
var comunidades_churitaca=new Array();
var comunidades_piriquina=new Array();

var centros_salud_churitaca=new Array();
var municipios_acacio=new Array();
var centros_salud_piriquina=new Array();
var centros_salud_acacio=new Array();

comunidades_churitaca["Chijmuri"]="Chijmuri";
comunidades_churitaca["Torreni"]="Torreni";
comunidades_churitaca["Pucara"]="Pucara";
comunidades_churitaca["Challaviique"]="Challaviique";
comunidades_churitaca["Churitaca"]="Churitaca";

centros_salud_acacio['Churitaca']=comunidades_churitaca;


comunidades_piriquina['Cueva Pata']='Cueva Pata';
comunidades_piriquina['Cinto']='Cinto';
comunidades_piriquina['Yanayo Grande']='Yanayo Grande';
comunidades_piriquina['Chaucari']='Chaucari';

centros_salud_acacio['Piriquina']=comunidades_piriquina;

municipios_acacio['Acacio']=centros_salud_acacio;
provincias['Bilbao']=municipios_acacio;
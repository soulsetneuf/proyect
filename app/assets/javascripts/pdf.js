//var doc = new jsPDF();
//var doc = new jsPDF('p', 'in', 'letter');
var x=20,y=20,cabecera=0,cuerpo,len_cabecera=-1;
function setCabecera(datos)
{
   cabecera = datos;
}
function setCuerpo(datos)
{
   cuerpo = datos;
   console.log(cuerpo);
}
function showCabecera(datos)
{
	setCabecera(datos);
	console.log(cabecera);
	//len_cabecera=gon.cabecera.length - 1;
	len_cabecera= cabecera.length-1;
	console.log(len_cabecera);
   for (var i = len_cabecera; i >= 0; i--) {
       doc.text(x,y,MaysPrimera(cabecera[i]));
       x=x+30;
   }
}
function showCuerpo(datos)
{
	setCuerpo(datos);
	x=20,y=y+10;
	for(item of cuerpo){
		x=20;
		  for (var i = 0; i <= len_cabecera; i++) {
            console.log("cabecera");
		  	console.log(cabecera[i]);
		  	doc.text(x,y,item[cabecera[i]]);
		  	x=x+20;
		  }
		  y=y+10;
        }
}
function MaysPrimera(string){
  return string.charAt(0).toUpperCase() + string.slice(1);
}
function demoFromHTML() {
    var pdf = new jsPDF('landscape', 'pt', 'letter',false);
    // source can be HTML-formatted string, or a reference
    // to an actual DOM element from which the text will be scraped.
    source = $('#imprecion')[0];

    // we support special element handlers. Register them with jQuery-style 
    // ID selector for either ID or node name. ("#iAmID", "div", "span" etc.)
    // There is no support for any other type of selectors 
    // (class, of compound) at this time.
    specialElementHandlers = {
        // element with id of "bypass" - jQuery style selector
        '#bypassme': function (element, renderer) {
            // true = "handled elsewhere, bypass text extraction"
            return true
        }
    };
    margins = {
        top: 20,
        bottom: 20,
        left: 40,
        width: 2000
    };
    // all coords and widths are in jsPDF instance's declared units
    // 'inches' in this case
    pdf.fromHTML(
    source, // HTML string or DOM elem ref.
    margins.left, // x coord
    margins.top, { // y coord
        'width': margins.width, // max width of content on PDF
        'elementHandlers': specialElementHandlers
    },

    function (dispose) {
        // dispose: object with X, Y of the last line add to the PDF 
        //          this allow the insertion of new lines after html
        pdf.save('Test.pdf');
    }, margins);
}
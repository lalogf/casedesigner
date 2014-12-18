var canvas; 
var imgElement; 
var imgInstance;
var butn;
var cod;




$(document).ready(function(){
  createCanvas();
  
  $(".designtocase").click(function(){
    cod = (parseInt(this.id) - 1);
    createImage(cod);
    event.preventDefault();
    canvas.add(imgInstance);
    $('#newcaseimage').val(canvas.toDataURL('image/png'));
  });
});





var createCanvas = function (){
  canvas = new fabric.Canvas('c');
  canvas.setHeight(600);
  canvas.setWidth(400);
  canvas.setOverlayImage('/assets/i62.png', canvas.renderAll.bind(canvas));
}; 


var createImage = function(cod){
  imgElement = $('.designtocase')[cod];
  imgInstance = new fabric.Image(imgElement, {
    height: 600,
    width: 400,
    left: 0,
    top: 0,
  });
};

var canvas; 
var imgElement; 
var imgInstance;
var butn;
var cod;





var ready = function(){
  createCanvas();
  $('#myselect').change(function(){
    if(($(this).val()) == 2 ){
      canvas.setOverlayImage('/assets/i5.png', canvas.renderAll.bind(canvas))
    } else if (($(this).val()) == 4) {
      canvas.setOverlayImage('/assets/s5t.png', canvas.renderAll.bind(canvas))
    } else if (($(this).val()) == 5) {
      canvas.setOverlayImage('/assets/motog.png', canvas.renderAll.bind(canvas))
    } else if (($(this).val()) == 1){
      canvas.setOverlayImage('/assets/i6.png', canvas.renderAll.bind(canvas))
    } else if (($(this).val()) == 3) {
      canvas.setOverlayImage('/assets/i4t.png', canvas.renderAll.bind(canvas))
    }
  });
  
  $(".designtocase").click(function(){
    cod = (parseInt(this.id));
    createImage(cod);
    event.preventDefault();
    canvas.add(imgInstance);
    canvas.controlsAboveOverlay = true;
    canvas.item(0).set({
        borderColor: 'black',
        cornerColor: 'black',
        cornerSize: 20,
        transparentCorners: false
      });
    canvas.setActiveObject(canvas.item(0));    
    $('#create').click(function(){
      canvas.deactivateAll().renderAll();
      $('#newcaseimage').val(canvas.toDataURL('image/png'));
    }); 
  });
};


var createCanvas = function (){
  canvas = new fabric.Canvas('c');
  canvas.setHeight(600);
  canvas.setWidth(400);
  canvas.setOverlayImage('/assets/i6.png', canvas.renderAll.bind(canvas));
}; 

var createImage = function(cod){
  imgElement = $('.designtocase')[cod];
  imgInstance = new fabric.Image(imgElement, {
    height: 600,
    width: 400,
    scaleY:300/imgElement.width,
    scaleX:200/imgElement.width,
    left: 0,
    top: 0,
  },{ crossOrigin: 'anonymous' } );
};

$(document).ready(ready);
$(document).on('page:load', ready);


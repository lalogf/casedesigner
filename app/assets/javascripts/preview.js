var canvas; 
var imgElement; 
var imgInstance;
var butn;




$(document).ready(function(){
  createCanvas();
  createImage();
  butn = document.getElementById("createcase");
  butn.addEventListener("click", function(event){
    event.preventDefault();
    canvas.add(imgInstance);
    $('#newcaseimage').val(canvas.toDataURL('image/png'));
  }, 
  false);
});





var createCanvas = function (){
  canvas = new fabric.Canvas('c');
  canvas.setHeight(600);
  canvas.setWidth(400);
  canvas.setOverlayImage('/assets/i62.png', canvas.renderAll.bind(canvas));
}; 


var createImage = function(){
  imgElement = $('#my-image')[0];
  imgInstance = new fabric.Image(imgElement, {
    height: 600,
    width: 400,
    left: 0,
    top: 0,
  });
  // console.log(canvas.toDataURL('image/png'));
};

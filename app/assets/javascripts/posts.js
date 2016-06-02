$(function(){

  $('#masonry-container').masonry({
    itemSelector: '.box',
    columnWidth: 5,
    gutterWidth: 0,
    isAnimated: !Modernizr.csstransitions,
    isFitWidth: true
  });

});

var loadFile = function(event) {  
  var output = document.getElementById('image-preview');
  output.src = URL.createObjectURL(event.target.files[0]);
};
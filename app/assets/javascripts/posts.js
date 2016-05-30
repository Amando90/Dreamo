$(function(){

  $('#masonry-container').masonry({
    itemSelector: '.box',
    columnWidth: 5,
    gutterWidth: 0,
    isAnimated: !Modernizr.csstransitions,
    isFitWidth: true
  });

});
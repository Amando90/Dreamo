$(function(){

  $('#masonry-container').masonry({
    itemSelector: '.box',
    columnWidth: 200,
    gutterWidth: 0,
    isAnimated: !Modernizr.csstransitions,
    isFitWidth: true
  });

});

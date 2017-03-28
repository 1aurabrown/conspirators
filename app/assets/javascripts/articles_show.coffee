app.controllerInitializers.articles_show = ->
  $('.article-slideshow').flickity({
    wrapAround: true;
    setGallerySize: false;
    imagesLoaded: true;
  })


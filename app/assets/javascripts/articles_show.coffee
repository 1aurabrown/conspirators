app.controllerInitializers.articles_show = ->
  $slideshow = $('.article-slideshow')

  featuredIndex = $slideshow.find('.article-slideshow-cell')
    .index $('.article-slideshow-cell.featured')

  slideshow = $slideshow.flickity({
    wrapAround: true
    setGallerySize: false
    imagesLoaded: true
    initialIndex: featuredIndex || 0
  })

  $slideshow.imagesLoaded -> $slideshow.addClass 'images-loaded'

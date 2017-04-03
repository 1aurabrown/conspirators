app.controllerInitializers.articles_show = ->
  $slideshow = $('.article-slideshow')

  slideshow = $slideshow.flickity({
    wrapAround: true
    setGallerySize: false
    imagesLoaded: true
  })

  featuredIndex = $('.article-slideshow .article-slideshow-cell')
    .index $('.article-slideshow-cell.featured')

  if featuredIndex > 0
    slideshow.flickity('select', featuredIndex, false, true )

  $slideshow.imagesLoaded ->
    $slideshow.addClass 'images-loaded'

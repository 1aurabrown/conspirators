# Place all the behaviors and hooks related to the matching app.scroll here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


app.controllerInitializers.talents = ->
  return unless $('body').hasClass 'talents'
  new (ScrollMagic.Scene)(
      offset: 240
      reverse: true)
    .setPin('#page-cover')
    .addTo(app.scroll)

  new (ScrollMagic.Scene)(
      offset: 240
      reverse: true)
    .setPin('#page-header')
    .addTo(app.scroll)

  new (ScrollMagic.Scene)(
      offset: 0
      duration: 300
      )
    .setTween(
      TweenLite.to($('#cover-image')[0], 2, {className: '+=conspiring'}))
    .addTo(app.scroll)
  new (ScrollMagic.Scene)(
      offset: -10
      duration: 290
      reverse: true
      )
    .setTween(
      TweenLite.to($('#cover-image')[0], 2, {className: '-=conspiring'}))
    .addTo(app.scroll)

  new (ScrollMagic.Scene)(
      offset: 240
      duration: 200
      reverse: true)
    .setTween(
      TweenLite.to($('.icon-logo')[0], 2, {color: 'white'}))
    .addTo(app.scroll)

  new (ScrollMagic.Scene)(
      offset: 260
      duration: 180
      reverse: true)
    .setTween(
      TweenLite.to($('.talent-atts')[0], 2, {opacity: 0;}))
    .addTo(app.scroll)


  new (ScrollMagic.Scene)(
      offset: 300
      duration: 180
      reverse: true)
    .setTween(
      TweenLite.to($('#cover-image')[0], 2, {opacity: 0;}))
    .addTo(app.scroll)


  showOverlayImage =  (selector)->
    $('.overlay-img-container').removeClass('active')
    $(selector).addClass('active')

    $('.overlay-img-container').removeClass('next')
    $('.overlay-img-container').removeClass('prev')

    $next = $('.overlay-img-container.active').next('.overlay-img-container')
    if $next.length
      $next.addClass 'next'
    else
      $('.overlay-img-container:first').addClass 'next'
    $prev = $('.overlay-img-container.active').prev('.overlay-img-container')
    if $prev.length
      $prev.addClass 'prev'
    else
      $('.overlay-img-container:last').addClass 'prev'

  app.scroll.scrollTo (newScrollPos) ->
    $("html, body").animate({scrollTop: newScrollPos})
  
  galleryPictures = $('.gallery-img-container').clone()
    .removeClass('gallery-img-container').addClass('overlay-img-container')
    .appendTo('#gallery-overlay')

  $('.gallery-img-container').click (e) ->
    e.preventDefault()
    window.targ = e.target
    currentPicture = e.target.dataset.imageId
    console.log currentPicture
    app.scroll.scrollTo(440)
    $('body').addClass('overlaid')
    showOverlayImage ".overlay-img-container[data-image-id=#{currentPicture}]"

  $('.overlay-img-container').click (e) ->
    e.preventDefault()

  $('#gallery-overlay .arrow').click (e) ->
    e.preventDefault()
    showOverlayImage ".overlay-img-container.#{e.target.dataset.direction}"

  $('.close-gallery').click ->
    $('body').removeClass('overlaid')
# Place all the behaviors and hooks related to the matching app.scroll here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


app.controllerInitializers.talents_show = ->
  return unless $('body').hasClass 'talents'
  return if not $('body').data('action') == 'show'
  (new TalentsShowController).init()

class TalentsShowController
  init: ->
    @$overlay = $("#gallery-overlay")
    @setupScroll()

    $('.gallery-img-container').click (e) =>
      e.preventDefault()
      @openOverlay()
      @showOverlayImage $(".overlay-img-container[data-image-id=#{e.target.dataset.imageId}]")

  openOverlay: ->
    return if @overlaid
    @overlaid = true

    $('body').on 'transitionend', ({ target }) =>
      return if @$overlay is not target
      $('body').off 'transitionend'
      @setupEvents()

    @$overlay.show 0, -> $('body').addClass 'overlaid'

  setupEvents: ->
    $('#gallery-overlay .arrow').click (e) =>
      e.preventDefault()
      @showImageByDirection e.target.dataset.direction

    $('#gallery-overlay').hammer().on 'swipeleft', (e) =>
      e.preventDefault()
      @showImageByDirection 'next'

    $('#gallery-overlay').hammer().on 'swiperight', (e) =>
      e.preventDefault()
      @showImageByDirection 'prev'

    $('.gallery-close').click @close

    key 'left', =>
      @showImageByDirection 'prev'
      off

    key 'right', =>
      @showImageByDirection 'next'
      off

    key 'esc', @close

  setupScroll: ->
    new ScrollMagic.Scene
      offset: 240
      reverse: true
    .setPin '#page-cover', pushFollowers: false
    .addTo app.scroll

    new ScrollMagic.Scene
      offset: 240
      reverse: true
    .setClassToggle '#page-header', "pinned"
    .setPin '#page-header', pushFollowers: false
    .addTo app.scroll

    new ScrollMagic.Scene
      offset: 0
      duration: 300
    .setTween TweenLite.to $('#cover-image')[0], 2, { className: '+=conspiring' }
    .addTo app.scroll

    new ScrollMagic.Scene
      offset: -10
      duration: 290
      reverse: true
    .setTween TweenLite.to $('#cover-image')[0], 2, { className: '-=conspiring' }
    .addTo app.scroll

    new ScrollMagic.Scene
      offset: 240
      duration: 200
      reverse: true
    .setTween TweenLite.to $('.icon-logo')[0], 2, { color: 'white' }
    .addTo app.scroll

    new ScrollMagic.Scene
      offset: 260
      duration: 180
      reverse: true
    .setTween TweenLite.to $('.talent-atts')[0], 2, { opacity: 0 }
    .addTo app.scroll


    new ScrollMagic.Scene
      offset: 300
      duration: 180
      reverse: true
    .setTween TweenLite.to $('#cover-image')[0], 2, { opacity: 0 }
    .addTo app.scroll

  showImageByDirection: (direction) ->
    @showOverlayImage @$prevOrNext direction

  $prevOrNext: (direction) ->
    $ ".overlay-img-container.#{direction}"

  close: =>
    @galleryTransitionActive = true
    $('.overlay-img-container').removeClass 'active'
    $('.overlay-img-container').removeClass 'next'
    $('.overlay-img-container').removeClass 'prev'
    $('body').on('transitionend', ({ target }) =>
      return if @$overlay is not target
      @$overlay.hide()
      @galleryTransitionActive = false
      @overlaid = false
      $('body').off 'transitionend'
    )
    $('body').removeClass('overlaid')

  showOverlayImage: ($el) =>
    return if @galleryTransitionActive
    @galleryTransitionActive = true

    $('.overlay-img-container').removeClass 'active'
    $('.overlay-img-container').removeClass 'next'
    $('.overlay-img-container').removeClass 'prev'

    setTimeout =>
      @galleryTransitionActive = false
    , 400
    $el.addClass('active')

    $next = if ($e = $el.next('.overlay-img-container')).length
      $e
    else
      $('.overlay-img-container:first')
    $next.addClass 'next'

    $prev = if ($e = $el.prev('.overlay-img-container')).length
      $e
    else
      $('.overlay-img-container:last')
    $prev.addClass 'prev'

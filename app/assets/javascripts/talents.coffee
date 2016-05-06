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
  $(document).delegate '*[data-toggle="lightbox"]', 'click', (event) ->
    event.preventDefault()
    $(this).ekkoLightbox()
    return



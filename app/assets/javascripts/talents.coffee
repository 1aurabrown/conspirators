# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

controller = new (ScrollMagic.Controller)

initTalentScroll = ->
  return unless $('body').hasClass 'talents'
  new (ScrollMagic.Scene)(
      offset: 240
      reverse: true)
    .setPin('#page-cover')
    .addTo(controller)

  new (ScrollMagic.Scene)(
      offset: 240
      reverse: true)
    .setPin('#page-header')
    .addTo(controller)

  new (ScrollMagic.Scene)(
      offset: 0
      duration: 300
      reverse: true)
    .setTween(
      TweenLite.to($('#cover-image')[0], 2, {top: '100px', height: '150%'}))
    .addTo(controller)

  grid = $('.grid')
  msnry = undefined
  grid.imagesLoaded ->
    # init Isotope after all images have loaded
    msnry = new Masonry(grid[0],
      itemSelector: '.grid-item'
      columnWidth: '.grid-sizer'
      percentPosition: true)
    return


$ ->
  initTalentScroll()
$(document).on 'page:load', initTalentScroll
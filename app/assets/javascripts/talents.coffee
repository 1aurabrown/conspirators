# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

controller = new (ScrollMagic.Controller)

$ ->

  new (ScrollMagic.Scene)(
      triggerElement: '#page-header'
      triggerHook: 0
      reverse: true)
    .setPin('#page-cover')
    .addTo(controller)

  new (ScrollMagic.Scene)(
      triggerElement: '#page-header'
      triggerHook: 0
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
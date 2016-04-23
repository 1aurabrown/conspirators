window.app = {
  init: ->
    controller = $('body').data('controller')
    if (app.controllerInitializers[controller])
      app.controllerInitializers[controller]()
  scroll: new (ScrollMagic.Controller)
  controllerInitializers: {}
}

$ ->
  app.init()
$(document).on 'page:load', app.init
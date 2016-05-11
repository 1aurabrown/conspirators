window.app = {
  init: ->
    controller = $('body').data('controller')
    if (app.controllerInitializers[controller])
      app.controllerInitializers[controller]()
  scroll: new (ScrollMagic.Controller)
  controllerInitializers: {}
  components: {}
  collectionData: {}
}

$ ->
  app.init()
  new app.components.Bookmarks()
$(document).on 'page:load', app.init
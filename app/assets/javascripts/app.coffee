window.app = {
  state: {}
  events: _.extend({}, Backbone.Events)
  init: ->
    controller = $('body').data('controller')
    if (app.controllerInitializers[controller])
      app.controllerInitializers[controller]()
  scroll: new (ScrollMagic.Controller)
  controllerInitializers: {}
  components: {}
  collectionData: {}
  componentViews: {}
}

$ ->
  app.init()
  app.componentViews.saveButtons = []
  $('.save-button').each (i, el) ->
    console.log el
    app.componentViews.saveButtons.push(
      new app.components.Bookmarks({el: el}))



$(document).on 'page:load', app.init

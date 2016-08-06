window.app = {
  state: {}
  events: _.extend({}, Backbone.Events)
  init: ->
    controller = $('body').data('controller')
    action = $('body').data('action')
    if (app.controllerInitializers["#{controller}_#{action}"])
      app.controllerInitializers["#{controller}_#{action}"]()
  scroll: new (ScrollMagic.Controller)
  controllerInitializers: {}
  components: {}
  collectionData: {}
  componentViews: {
    saveButtons: []
  }
}

$ ->
  new FastClick(document.body)
$(document).on 'ready page:load', ->
  app.init()
  _.each app.componentViews.saveButtons, (saveBtn) ->
    saveBtn.undelegateEvents()
  app.componentViews.saveButtons = []
  app.componentViews.navigation = new app.components.Navigation()
  $('.save-button').each (i, el) ->
    app.componentViews.saveButtons.push(
      new app.components.Faves({el: el}))
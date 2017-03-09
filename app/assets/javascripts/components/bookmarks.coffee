class app.components.Faves extends Backbone.View

  constructor: (options) ->
    super(options)
    @talent = @$el.data('talent')
    app.events.on 'savedtalents:change', (result) =>
      @changeState(result.saved)

  handleClick:  =>
    $.post "/api/v1/talents/#{@talent}/edit_collection.json", (result) ->
      app.events.trigger('savedtalents:change', result)

  changeState: (saved) =>
    action = if saved then 'add' else 'remove'
    @$el["#{action}Class"] 'active'
    if action == 'add'
      $('.faves').addClass('pop')
      $('.faves').bind "webkitTransitionEnd mozTransitionEnd oTransitionEnd msTransitionEnd transitionend", =>
        $('.faves').removeClass("pop");


  events: {
    "click": 'handleClick'
  }
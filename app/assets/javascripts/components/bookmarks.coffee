class app.components.Bookmarks extends Backbone.View

  constructor: (options) ->
    super(options)
    @talent = @$el.data('talent')  

  handleClick: (target) =>
    if @talent 
      $.post "/api/v1/talents/#{@talent}/edit_collection.json", (result) -> 
        if (result.saved)
          target.addClass('active')
        app.events.trigger('savedtalents:change', result)

  events: {
    "click": 'handleClick'
  }
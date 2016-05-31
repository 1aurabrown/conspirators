class app.components.Bookmarks 
  constructor: ->
    $('.save-button').on 'click', (e) =>
      target = $(e.target).closest('a')
      @handleClick(target)

  handleClick: (target) =>
    talent = target.data('talent')
    if talent 
      $.post "/api/v1/talents/#{talent}/edit_collection.json", (result) -> 
        if (result.saved)
          target.addClass('active')
        app.events.trigger('savedtalents:change', result)

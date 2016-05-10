class app.components.Bookmarks 
  constructor: ->
    $('.save-button').on 'click', (e) =>
      talent = $(e.target).closest('a').data('talent')
      if talent 
        @handleClick talent
  handleClick: (talent) =>
    $.post "/api/v1/talents/#{talent}/add_to_collection.json",
      success: (a) -> console.log a

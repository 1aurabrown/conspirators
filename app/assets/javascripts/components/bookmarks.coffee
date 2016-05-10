class app.components.Bookmarks 
  constructor: ->
    $('.save-button').on 'click', (e) =>
      talent = $(e.target).closest('a').data('talent')
      if talent 
        @handleClick talent
  handleClick: (talent) =>
    $.post "/api/v1/talents/#{talent}/edit_collection.json", (a, b, c) -> 
      console.log a,b,c

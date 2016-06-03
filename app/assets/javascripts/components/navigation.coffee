class app.components.Navigation extends Backbone.View
  constructor: ->
    super
    @savedBadge = @$('.saved-talents')
    app.events.on 'savedtalents:change', (result) => 
      @updateBookmarks(result.totalSaved, result.saved)

  el: '#navigation'

  updateBookmarks: (total, saved) ->
    action = if total then 'add' else 'remove'
    @$('.bookmarks')["#{action}Class"] 'present'
    @savedBadge.text(total)

  bookmarkClick: (e) ->
    if @$('.bookmarks').hasClass('present')
      return true
    else
      e.preventDefault()

      $('#no-bookmarks-modal').modal('show')



  events: {
    'click .bookmarks a': 'bookmarkClick'
  }
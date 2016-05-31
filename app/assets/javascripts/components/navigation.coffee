class app.components.Navigation extends Backbone.View
  constructor: ->
    super
    @savedBadge = @$('.saved-talents')
    app.events.on 'savedtalents:change', (result) => 
      @updateBookmarks(result.totalSaved, result.saved)

  el: '#navigation'

  updateBookmarks: (total, saved) ->
    action = if total then 'add' else 'remove'
    @savedBadge["#{action}Class"] 'present'
    @savedBadge.text(total)
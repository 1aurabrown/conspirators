class app.components.Navigation extends Backbone.View
  constructor: ->
    super
    @savedBadge = @$('.saved-talents')
    app.events.on 'savedtalents:change', (result) => 
      @updateFaves(result.totalSaved, result.saved)

  el: '#navigation'

  updateFaves: (total, saved) ->
    action = if total then 'add' else 'remove'
    @$('.faves')["#{action}Class"] 'present'
    @savedBadge.text(total)

  favesClick: (e) ->
    if @$('.faves').hasClass('present')
      return true
    else
      e.preventDefault()

      $('#no-faves-modal').modal('show')



  events: {
    'click .faves a': 'favesClick'
  }
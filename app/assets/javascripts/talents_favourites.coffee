app.controllerInitializers.talents_favourites = ->
  $('form.form').submit (e) ->
    url = '/api/v1/inquiries'
    # the script where you handle the form input.
    $.ajax
      type: 'POST'
      url: url
      data: $('#idForm').serialize()
      success: (data) ->
        alert data
        # show response from the php script.
        return
    e.preventDefault()
    # avoid to execute the actual submit of the form.
    return


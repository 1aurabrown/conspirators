class ArticleSettings
  toggleMedia: =>
    @options ?= @$mediaDropdown.find('option')
      .map -> this.text
      .toArray()
      .filter (option) -> option? and option.length > 0

    selected = @$mediaDropdown.find(':selected').text()
    @$form
      .find(".article_#{selected}_field")
      .addClass 'visible'
      .slideDown()

    @options
      .filter (option) -> option isnt selected
      .forEach (unselected) =>
        @$form.find(".article_#{unselected}_field")
          .removeClass 'visible'
          .slideUp()

  constructor: (options) ->
    { @$form } = options
    return if not @$form?.length

    # Add a star to the tab for the currently featured image

    @$images = $('.article_images_field')
    $selected = @$images.find('.fields.tab-pane').has('.featured_field input:checked')
    if $selected.length
      id = $selected.attr('id')
      @$images.find(".nav.nav-tabs a[href=##{id}]").addClass 'is-featured'

    # Handle featured image selection/deselection
    @$images.on 'change.article_featured_image', '.featured_field input', (e) =>
      @$images.find(".nav.nav-tabs a.is-featured").removeClass 'is-featured'
      return if not checked = e.currentTarget.checked
      id = e.currentTarget.closest('.fields.tab-pane').id

      # Add star to nav tab
      @$images.find(".nav.nav-tabs a[href=##{id}]").addClass 'is-featured'

      # Uncheck previously selected image
      @$images.find('.featured_field input:checked').not(e.currentTarget).attr('checked', null)

    # Handle Media Type selection
    @$mediaDropdown = @$form.find('[name="article[media_type]"]')
    @toggleMedia()
    @$mediaDropdown.on 'change.article_media_type', @toggleMedia

$ ->
  setup = ->
    $form = $('form#edit_article') if $('form#edit_article').length
    $form ?= $('form#new_article') if $('form#new_article').length
    new ArticleSettings { $form } if $form

  # Called only on non-pjax load
  setup()

  # For subsequent pjax loads
  $('[data-pjax-container]').on 'pjax:end', ->
    $(document).one 'rails_admin.dom_ready', ->
      setup()

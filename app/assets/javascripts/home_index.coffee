# Place all the behaviors and hooks related to the matching app.scroll here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


app.controllerInitializers.home_index = ->
  return unless $('body').hasClass 'home'
  new (ScrollMagic.Scene)(
      offset: 0
    )
    .setPin('#page-header')
    .addTo(app.scroll)

  $('.tag-selection-tag').click (e) ->
    $(this).toggleClass('active')
    visibleTags = $('.tag-selection-tag.active').toArray().map (el) -> 
      parseInt(el.dataset.tag)
        
  grid = $('.section-content').imagesLoaded ->
    grid.isotope(
      itemSelector: '.card-container'
    )

  refresh = ->
    activeTags = $('.tag-selector.active').map( ->
      return parseInt(this.dataset.tag)
    ).get()
    if activeTags.length
      matchingTalents = _.filter gon.tags, (t) ->
        _.intersection(activeTags, t.tags).length
      matchingIds = _.map( matchingTalents, (t) -> t.id)

      grid.isotope {
        filter: (item) ->
          parseInt(this.dataset.talent) in matchingIds
      }
    else
      grid.isotope {
        filter: ->
          return true
      }


  $('#tag-selection').on 'click', '.tag-selector', (e) ->
    e.preventDefault()
    $(e.target).toggleClass 'active'
    refresh()
  # $('.button-group').each (i, buttonGroup) ->
  #   $buttonGroup = $(buttonGroup)
  #   $buttonGroup.on 'click', 'button', ->
  #     $buttonGroup.find('.is-checked').removeClass 'is-checked'
  #     $(this).addClass 'is-checked'
  #     return
  #   return
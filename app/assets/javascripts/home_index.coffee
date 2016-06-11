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

  grid = $('.section-content').imagesLoaded ->
    grid.isotope(
      itemSelector: '.card-container'
    )

  refresh = ->
    activeTag = $('.tag-selector.active').data('tag')
    if activeTag
      matchingTalents = _.filter gon.tags, (t) ->
        _.contains(t.tags, activeTag)
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
    if ($(e.target).hasClass('active'))
      $(e.target).removeClass('active')
    else
      $('.tag-selector').removeClass('active')
      $(e.target).addClass('active')
    refresh()
  # $('.button-group').each (i, buttonGroup) ->
  #   $buttonGroup = $(buttonGroup)
  #   $buttonGroup.on 'click', 'button', ->
  #     $buttonGroup.find('.is-checked').removeClass 'is-checked'
  #     $(this).addClass 'is-checked'
  #     return
  #   return
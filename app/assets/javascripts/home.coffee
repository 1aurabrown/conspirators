# Place all the behaviors and hooks related to the matching app.scroll here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


app.controllerInitializers.home = ->
  return unless $('body').hasClass 'home'

  getTalentTags = (talent) ->
    app.collectionData.talents.find( (t) -> t.id == talent ).acceptable_tags
  compareTags = ->
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
      matchingTalents = _.filter app.collectionData.talents, (t) ->
        _.intersection(activeTags, t.acceptable_tags).length
      console.log window.mt = matchingTalents
      matchingIds = _.map( matchingTalents, (t) -> t.id)
      console.log matchingIds

      grid.isotope {
        filter: (item) ->
          console.log this.dataset.talent 
          console.log matchingIds
          console.log (this.dataset.talent in matchingIds )
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
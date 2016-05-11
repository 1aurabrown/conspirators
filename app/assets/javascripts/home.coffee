# Place all the behaviors and hooks related to the matching app.scroll here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


app.controllerInitializers.home = ->
  return unless $('body').hasClass 'home'
  grid = $('.section-content').isotope(itemSelector: '.card-container')
  getTalentTags = (talent) ->
    app.collectionData.talents.find( (t) -> t.id == talent ).acceptable_tags
  compareTags = ->
  $('.tag-selection-tag').click (e) ->
    $(this).toggleClass('active')
    visibleTags = $('.tag-selection-tag.active').map -> 
      this.dataset.tag
      
    grid.isotope(
      filter: ->
        return true unless visibleTags.length
        talentTags = getTalentTags($(this).data('talent'))
        talentTags.filter((el) -> el not in visibleTags).length != talentTags.length
    )
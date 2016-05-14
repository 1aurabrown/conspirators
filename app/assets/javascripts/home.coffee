# Place all the behaviors and hooks related to the matching app.scroll here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


app.controllerInitializers.home = ->
  return unless $('body').hasClass 'home'

    new (ScrollMagic.Scene)(
      offset: 240
      reverse: true)
    .setPin('#page-cover')
    .addTo(app.scroll)

  new (ScrollMagic.Scene)(
      offset: 240
      reverse: true)
    .setPin('#page-header')
    .addTo(app.scroll)

  new (ScrollMagic.Scene)(
      offset: 240
      duration: 200
      reverse: true)
    .setTween(
      TweenLite.to($('.icon-logo')[0], 2, {color: 'white'}))
    .addTo(app.scroll)

  grid = $('.section-content').isotope(itemSelector: '.card-container')
  getTalentTags = (talent) ->
    app.collectionData.talents.find( (t) -> t.id == talent ).acceptable_tags
  compareTags = ->
  $('.tag-selection-tag').click (e) ->
    $(this).toggleClass('active')
    visibleTags = $('.tag-selection-tag.active').toArray().map (el) -> 
      parseInt(el.dataset.tag)
      
    grid.isotope(
      filter: ->
        return true unless visibleTags.length
        talentTags = getTalentTags($(this).data('talent'))
        talentTags.filter((el) -> el in visibleTags).length
    )
# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  $container = $('div.feed')

  $container.imagesLoaded ->
    $container.masonry(
      columnWidth: 200
      itemSelector: '.item'
    )


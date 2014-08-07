# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js. # You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/


$ ->


  $("#download_pdf_link").on "click", ->
    ga("send", "event", "All", "Clicked Download Link")

	$("#add_another_item").on "click", ->
		html = $(".line_item").first().html()
		$(".line_item").append(html)

	$(".remove_line").on "click", ->
		$(this).parents(".line_item").remove()



window.remove_fields = (link) ->
  $(link).parents(".fields").remove()
  return

window.add_fields = (link, association, content) ->
  new_id = new Date().getTime()
  regexp = new RegExp("new_" + association, "g")
  $(link).parent().before content.replace(regexp, new_id)
  return
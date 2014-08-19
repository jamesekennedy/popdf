# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js. # You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/


$ ->


  $(".track_clicks").on "click", ->
    window.analytics.track("Clicked #{$(this).html()}");


	$("#add_another_item").on "click", ->
		html = $(".line_item").first().html()
		$(".line_item").append(html)

	$(".remove_line").on "click", ->
		$(this).parents(".line_item").remove()


 $(".alert-box").each  ->
  window.analytics.track( $(this).html() )

window.remove_fields = (link) ->
  $(link).parents(".fields").remove()
  return

window.add_fields = (link, association, content) ->
  new_id = new Date().getTime()
  regexp = new RegExp("new_" + association, "g")
  $(link).parent().before content.replace(regexp, new_id)
  return
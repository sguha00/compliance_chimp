$ = jQuery

$ ->
  show_current_image_proof($("#proof_filepicker_url").val()) if $("#proof_filepicker_url").val()
  $("#proof_filepicker_url").on "change", (event) -> show_current_image_proof(event.originalEvent.fpfile.url)

show_current_image_proof = (image_url) ->
  image_template = $(".current-proof-image").data("image-proof-template")
  image = image_template.replace(/src="(.*)"/, "src='#{image_url}$1'")
  $(".current-proof-image img").remove()
  $(".current-proof-image").show().append(image)

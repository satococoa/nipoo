# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(document).ready ->

  preview = ->
    mkd = markdown.toHTML $('#report_body').val()
    $('#preview').html mkd

  $('#report_body').keyup -> preview()

  preview() if $('#report_body').val().length > 0


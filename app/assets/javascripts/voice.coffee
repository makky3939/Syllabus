# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


# if audio.canPlayType 'audio/mp3'
#   alert 'mp3'

$(document).on 'page:change', ->
  $('.js-voice-teacher').on 'click', ->
    filename = $(@).data('voice')
    console.log filename
    # audio = new Audio "/audios/default/phone_vibration.mp3
    audio = new Audio "/audios/teachers/#{filename}"

    $audio = $ audio
    $button = $ @

    $audio.on 'loadedmetadata', ->
      # console.log audio.duration
      audio.play()
      return

    $audio.on 'playing', ->
      $button.addClass 'disabled'
      return

    $audio.on 'ended', ->
      $button.removeClass 'disabled'
      return
    return

  $('.js-voice-subject').on 'click', ->
    filename = $(@).data('voice')
    console.log filename
    # audio = new Audio "/audios/default/phone_vibration.mp3
    audio = new Audio "/audios/subjects/#{filename}"

    $audio = $ audio
    $button = $ @

    $audio.on 'loadedmetadata', ->
      # console.log audio.duration
      audio.play()
      return

    $audio.on 'playing', ->
      $button.addClass 'disabled'
      return

    $audio.on 'ended', ->
      $button.removeClass 'disabled'
      return
    return
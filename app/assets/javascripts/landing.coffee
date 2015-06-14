# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


class Teacher
  delay = 100
  $list = []

  remove = ->
    $list = $ '#js-teacher-faces'
    $list.empty()

  show = ->
    $.each $list.find('.img-circle'), (key, value) ->
      $(value).on 'load', ->
        setTimeout ->
          $ value
            .addClass 'anime-circle'
            .removeClass 'anime-circle-base'
        , (delay * (key + 1))
        return
      return
    return

  update = (teachers) ->
    remove()

    $.each teachers, (key, value) ->
      $li = $ '<li>',
        'title': 'この先生の担当科目を調べる'
        'data-toggle': 'tooltip'
        'data-placement': 'bottom'

      $a = $ '<a>',
        href: "/teachers/#{value.id}"

      $img = $ '<img>',
        addClass: 'img-circle anime-circle-base'
        src: "/images/teachers/#{value.face_filename}"

      $li.tooltip()
      $a.append $img
      $list.append $li.append($a)
      show()

      $('.js-voice-teacher').data('voice', teachers[0].voice_filename)
      $('.js-teacher-name').text(teachers[0].name)
      $('.js-teacher-kana').text(teachers[0].kana)
      $('.js-teacher-link').attr('href', "/teachers/#{teachers[0].id}")
      return
    return

  load = ->
    $.ajax
      url: '/api/teachers'
      datType: 'json'
      cache: false
      success: update

  refresh: ->
    load.call @
    return

teacher = new Teacher()

$(document).on 'page:change', ->
  $('[data-toggle="tooltip"]').tooltip()
  if document.location.pathname == '/'
    teacher.refresh()

  $('.js-teacher-refersh').on 'click', ->
    teacher.refresh()
  return
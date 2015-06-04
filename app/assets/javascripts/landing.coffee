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
      setTimeout ->
        $ value
          .addClass 'anime-circle'
          .removeClass 'anime-circle-base'
      , delay * (key + 1)
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

$(document).on 'ready', ->
  $('[data-toggle="tooltip"]').tooltip()

$(document).on 'page:change', ->
  if document.location.pathname == '/'
    teacher.refresh()

  $('.js-teacher-refersh').on 'click', ->
    teacher.refresh()
  return
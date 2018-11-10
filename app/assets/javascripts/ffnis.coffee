# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready -> 
    $('.upvote').click ->
      upvotes  = parseInt($('#upvotes').val()) + 1
      downvotes  = parseInt($('#downvotes').val())
      user_id = $('#user_id').val()
      ffni_id = $('#ffni_id').val()
      topic = $('#topic').val()
      media = $('#media').val()
      content = $('#content').val()
      total = upvotes+downvotes
      badge = (upvotes/total)*100
      authenticity_token = $('#authenticity_token').val()
      $.ajax
        url: "/users/#{user_id}/ffnis/#{ffni_id}"
        type: 'PUT'
        data: {utf8: '✓',
        authenticity_token: authenticity_token,
        ffni: {
          topic: topic,
          media: media,
          content: content,
          badge: badge,
          upvotes: upvotes,
          downvotes: downvotes,
          authenticity_token: authenticity_token
        }}

    $('.downvote').click -> 
      upvotes  = parseInt($('#upvotes').val())
      downvotes  = parseInt($('#downvotes').val()) + 1
      user_id = $('#user_id').val()
      ffni_id = $('#ffni_id').val()
      topic = $('#topic').val()
      media = $('#media').val()
      content = $('#content').val()
      total = upvotes+downvotes
      badge = (upvotes/total)*100
      authenticity_token = $('#authenticity_token').val()
      $.ajax
        url: "/users/#{user_id}/ffnis/#{ffni_id}"
        type: 'PUT'
        data: {utf8: '✓',
        authenticity_token: authenticity_token,
        ffni: {
          topic: topic,
          media: media,
          content: content,
          badge: badge,
          upvotes: upvotes,
          downvotes: downvotes
        }}
  

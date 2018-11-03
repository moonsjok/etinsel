App.chat = App.cable.subscriptions.create "ChatChannel",
 speak: (user_id,message) ->
    @perform 'speak',{user_id:user_id,message:message}

  connected: ->
    # Called when the subscription is ready for use on the server
     $(document).on 'keypress', '#message-to-send', (event)=>
         if event.keyCode is 13
           @speak($('#user_id').val(),event.target.value)
           event.target.value=""
           event.preventDefault()
  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
     $('#chat-history').append(data.message)
    

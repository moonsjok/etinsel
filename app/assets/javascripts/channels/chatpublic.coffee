App.chatpublic = App.cable.subscriptions.create "ChatpublicChannel",

  speak_: (name,message) ->
    @perform 'speak_',{name:name,message:message}

  connected: ->
    # Called when the subscription is ready for use on the server
    $(document).on 'keypress', '#messageToSend', (event) =>
        if event.keyCode is 13
            @perform 'speak_', {message: message}
            event.target.value = ""
            event.preventDefault()
  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
     $('#chatHistory').append(data.message)

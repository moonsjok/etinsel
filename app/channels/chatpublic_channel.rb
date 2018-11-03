class ChatpublicChannel < ApplicationCable::Channel
  def subscribed
     stream_from "etinsel chat public"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak_(data)
     message = Publictchat.create(name:data['name'], message: data['message'])
     html = ApplicationController.render(partial: 'publictchats/message',locals:{message: message})

     ActionCable.server.broadcast('etinsel chat public',{message:html})
 end

end

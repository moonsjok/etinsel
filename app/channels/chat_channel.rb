class ChatChannel < ApplicationCable::Channel
	def subscribed
		stream_from "Etinsel chat"

	end

    def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    end

   def speak(data)
	    message = Chat.create(user_id:data['user_id'], message: data['message'])
		  html = ApplicationController.render(partial: 'chats/message',locals:{message: message})

	    ActionCable.server.broadcast('Etinsel chat',{message:html})
	end



end

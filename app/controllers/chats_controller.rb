class ChatsController < ApplicationController
	  before_action :require_login
	def index
	    @chats = Chat.limit(50)
	end
end

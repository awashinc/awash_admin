class ChatsController < ApplicationController
  def index
    @chats = Chat.all
  end

 def show
   @chat = Chat.find(params[:id])
 end

 private
 def chat_params
   params.require(:chat).permit()
 end
end

# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class ChatChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from "awash_chat_#{params[:chat_id]}"
  end

  def send_message(data)
    current_user = User.first if current_user.blank?
    message = Message.new(user: current_user,
      chat_id: data['chat_id'],
      content: data['text']
    )
    if message.save
      ActionCable.server.broadcast("awash_chat_#{data['chat_id']}",
        message: render_message(message)
      )
    end

  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
  private
  def render_message(message)
    ChatsController.render partial: 'chats/message', locals: {message: message}
  end
end

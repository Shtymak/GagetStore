class Telegram::SendMessageJob < ApplicationJob
  queue_as :default
  require 'telegram/bot'
  def perform(text)
    token = '1538892077:AAFYsRnw5MrtWsRKcTHtc3sNXAMdNdbw5Rs'
    Telegram::Bot::Client.run(token) do |bot|
      bot.api.send_message(chat_id: -1001258501250, text: text)
    end
  end
end

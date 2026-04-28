require 'telegram/bot'
require_relative '../lib/bot_handler'
TOKEN = ENV.fetch('TELEGRAM_BOT_TOKEN')
handler = BotHandler.new

Telegram::Bot::Client.run(TOKEN) do |bot|
  bot.listen do |message|
    next unless message.text

    response = handler.handle(message.chat.id, message.text)

    bot.api.send_message(
      chat_id: message.chat.id,
      text: "📝 #{response}"
    )
  end
end
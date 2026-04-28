root_path = File.expand_path(__dir__)
gem_path = File.expand_path('../lib', __dir__)
$LOAD_PATH.unshift(gem_path)

require 'telegram/bot'
require 'mygem'

TOKEN = ENV.fetch('TELEGRAM_BOT_TOKEN')

user_mode = {} # 👈 состояние пользователей

Telegram::Bot::Client.run(TOKEN) do |bot|
  bot.listen do |message|
    next unless message.text

    chat_id = message.chat.id
    text = message.text

    case text

    when '/start'
      user_mode[chat_id] = nil

      bot.api.send_message(
        chat_id: chat_id,
        text: <<~TEXT
          Привет!

          Выбери режим:

          /translit — кириллица → латиница
          /reverse — латиница → кириллица
          /normalize — очистка текста
        TEXT
      )

    when '/translit'
      user_mode[chat_id] = :translit
      bot.api.send_message(chat_id: chat_id, text: "Режим: translit выбран")

    when '/reverse'
      user_mode[chat_id] = :reverse
      bot.api.send_message(chat_id: chat_id, text: "Режим: reverse выбран")

    when '/normalize'
      user_mode[chat_id] = :normalize
      bot.api.send_message(chat_id: chat_id, text: "Режим: normalize выбран")

    else
      mode = user_mode[chat_id]

      if mode.nil?
        bot.api.send_message(
          chat_id: chat_id,
          text: "❗ Сначала выбери режим: /translit /reverse /normalize"
        )
        next
      end

      result =
        case mode
        when :translit
          Mygem.translit(Mygem.normalize(text))
        when :reverse
          Mygem.reverse_translit(Mygem.normalize(text))
        when :normalize
          Mygem.normalize(text)
        end

      bot.api.send_message(
        chat_id: chat_id,
        text: "📝 #{result}"
      )
    end
  end
end
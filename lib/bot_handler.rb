require_relative 'mygem'

class BotHandler
  def initialize
    @user_mode = {}
  end

  def handle(chat_id, text)
    case text

    when '/start'
      @user_mode[chat_id] = nil
      return start_message

    when '/translit'
      @user_mode[chat_id] = :translit
      return "Режим: translit выбран"

    when '/reverse'
      @user_mode[chat_id] = :reverse
      return "Режим: reverse выбран"

    when '/normalize'
      @user_mode[chat_id] = :normalize
      return "Режим: normalize выбран"
    when '/auto'
      @user_mode[chat_id] = :auto
      return "Режим: auto выбран"
    else
      process_text(chat_id, text)
    end
  end

  private

  def start_message
    <<~TEXT
      Привет!

      Выбери режим:

      /translit — кириллица → латиница
      /reverse — латиница → кириллица
      /auto — автоматическое определение языка
      /normalize — очистка текста
    TEXT
  end

  def process_text(chat_id, text)
    mode = @user_mode[chat_id]

    return "❗ Сначала выбери режим" if mode.nil?

    case mode
    when :translit
      Mygem.translit(text)
    when :reverse
      Mygem.reverse_translit(text)
    when :normalize
      Mygem.normalize(text)
    when :auto
      Mygem.auto_translit(text)
    end
  end
end
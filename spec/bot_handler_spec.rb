require 'bot_handler'
require 'mygem'

RSpec.describe BotHandler do
  let(:handler) { BotHandler.new }
  let(:chat_id) { 1 }

  describe '#handle' do
    context 'команды' do
      it 'обрабатывает /start' do
        expect(handler.handle(chat_id, '/start')).to include('Привет')
      end

      it 'устанавливает translit режим' do
        expect(handler.handle(chat_id, '/translit'))
          .to eq('Режим: translit выбран')
      end

      it 'устанавливает reverse режим' do
        expect(handler.handle(chat_id, '/reverse'))
          .to eq('Режим: reverse выбран')
      end

      it 'устанавливает normalize режим' do
        expect(handler.handle(chat_id, '/normalize'))
          .to eq('Режим: normalize выбран')
      end
    end

    context 'без режима' do
      it 'просит выбрать режим' do
        expect(handler.handle(chat_id, 'привет'))
          .to include('Сначала выбери режим')
      end
    end

    context 'translit' do
      it 'переводит кириллицу в латиницу' do
        handler.handle(chat_id, '/translit')
        expect(handler.handle(chat_id, 'привет')).to eq('privet')
      end
    end

    context 'reverse' do
      it 'переводит латиницу в кириллицу' do
        handler.handle(chat_id, '/reverse')
        expect(handler.handle(chat_id, 'privet')).to eq('привет')
      end

      it 'сохраняет символы' do
        handler.handle(chat_id, '/reverse')
        expect(handler.handle(chat_id, 'privet!!!')).to eq('привет!!!')
      end
    end

    context 'normalize' do
      it 'очищает текст' do
        handler.handle(chat_id, '/normalize')
        expect(handler.handle(chat_id, 'Привет!!!')).to eq('привет')
      end
    end

    context 'состояние пользователей' do
      it 'сохраняет режим между сообщениями' do
        handler.handle(chat_id, '/translit')
        expect(handler.handle(chat_id, 'привет')).to eq('privet')
      end

      it 'разные пользователи независимы' do
        handler.handle(1, '/translit')
        handler.handle(2, '/reverse')

        expect(handler.handle(1, 'привет')).to eq('privet')
        expect(handler.handle(2, 'privet')).to eq('привет')
      end
    end
  end
end
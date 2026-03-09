require_relative 'mygem'

puts 'Тест транслитерации'
text = 'Ой здравствуйте.'
puts "Оригинал: #{text} -> #{Mygem.translit(text)}"

puts "\nПроверка регистра"
puts "Я -> #{Mygem.translit('Я')}"
puts "я. -> #{Mygem.translit('я.')}"
puts "ПРИВЕТ -> #{Mygem.translit('ПРИВЕТ')}"
puts "ПрИвЕт -> #{Mygem.translit('ПрИвЕт')}"

puts "\nМикс из чаров"
puts "Вот и end какbi -> #{Mygem.translit('Вот и end какbi')}"
puts "Разные words моzhno braть -> #{Mygem.translit('Разные words моzhno braть')}"
puts "Hello Привет world -> #{Mygem.translit('Hello Привет world')}"

puts "\nЦифры и спецсимволы"
puts "Пароль 123! -> #{Mygem.translit('Пароль 123!')}"
puts "@Привет# -> #{Mygem.translit('@Привет#')}"
puts "$Ёлка$ -> #{Mygem.translit('$Ёлка$')}"

puts "\nМягкий и твёрдый знак"
puts "подъезд -> #{Mygem.translit('подъезд')}"
puts "семья -> #{Mygem.translit('семья')}"

puts "\nДлинные строки"
puts ('Привет ' * 10).strip + " -> #{Mygem.translit('Привет ' * 10).strip}"
puts ('Это очень длинная строка для тестирования транслитерации ' * 3).strip +
     " -> #{Mygem.translit('Это очень длинная строка для тестирования транслитерации ' * 3).strip}"

puts "\nПолный алфавит"
puts "абвгдеёжзийклмнопрстуфхцчшщъыьэюя -> #{Mygem.translit('абвгдеёжзийклмнопрстуфхцчшщъыьэюя')}"

puts "\Emoji"
puts "Привет 😀 -> #{Mygem.translit('Привет 😀')}"

puts "\nПустые строки / nil"
puts "'' -> #{Mygem.translit('')}"
puts "nil -> #{Mygem.translit(nil)}"

puts "\nКомбинированные строки"
puts "Тест123 mixed ТЕКСТ!? -> #{Mygem.translit('Тест123 mixed ТЕКСТ!?')}"
puts "Я123abc Ёжик! -> #{Mygem.translit('Я123abc Ёжик!')}"
puts "Привет, мир! How are you? -> #{Mygem.translit('Привет, мир! How are you?')}"

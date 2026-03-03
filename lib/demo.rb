
require "mygem"


puts "Тест транслитерации"

text = "Ой здравствуйте."
result = Mygem.translit(text)

puts "Оригинал: #{text}"
puts "Результат: #{result}"

puts "Проверка регистра"
puts "Я -> #{Mygem.translit('Я')}"
puts "я. -> #{Mygem.translit('я.')}"

puts "Микс из чаров"
puts "Вот и end какbi -> #{Mygem.translit('Вот и end какbi')}"
puts "Разные words моzhno braть -> #{Mygem.translit('Разные words моzhno braть')}"
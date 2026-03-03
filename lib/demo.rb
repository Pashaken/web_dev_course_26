
require "mygem"


puts "Тест транслитерации"

text = "Ой здравствуйте."
result = Mygem.translit(text)

puts "Оригинал: #{text}"
puts "Результат: #{result}"

puts "Проверка регистра"
puts "Я -> #{Mygem.translit('Я')}"
puts "я -> #{Mygem.translit('я')}"
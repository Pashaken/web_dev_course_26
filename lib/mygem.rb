# frozen_string_literal: true

require_relative "mygem/version"

module Mygem
  class Error < StandardError; end
  TranslitArr = { 
    'а'=>'a',
    'б'=>'b',
    'в'=>'v',
    'г'=> 'g',
    'д'=>'d',
    'е'=>'e',
    'ё'=>'e',
    'ж'=> 'zh',
    'з'=>'z',
    'и'=>'i',
    'й'=>'y',
    'к'=> 'k',
    'л'=>'l',
    'м'=>'m',
    'н'=>'n',
    'о'=> 'o',
    'п'=>'p',
    'р'=>'r',
    'с'=>'s',
    'т'=> 't',
    'у'=>'u',
    'ф'=>'f',
    'х'=>'h',
    'ч'=> 'ch',
    'ш'=>'sh',
    'щ'=>'sha',
    'ъ'=>'',
    'ы'=> 'i',
    'ь'=>'',
    'э'=>'e',
    'ю'=>'iu',
    'я'=> 'ya',
    'ц'=> 'ts'}

  #переворачиваем мапу
  REVERSE_MAP = {
  'a'  => 'а',
  'b'  => 'б',
  'v'  => 'в',
  'g'  => 'г',
  'd'  => 'д',
  'e'  => 'е',
  'zh' => 'ж',
  'z'  => 'з',
  'i'  => 'и',
  'y'  => 'й',
  'k'  => 'к',
  'l'  => 'л',
  'm'  => 'м',
  'n'  => 'н',
  'o'  => 'о',
  'p'  => 'п',
  'r'  => 'р',
  's'  => 'с',
  't'  => 'т',
  'u'  => 'у',
  'f'  => 'ф',
  'h'  => 'х',
  'ch'=> 'ч',
  'sh'=> 'ш',
  'sha'=> 'щ',
  'ts'=> 'ц',
  'iu'=> 'ю',
  'ya'=> 'я'
}.freeze
  #кирилица - латиница
  def self.translit(text)
    return "" if text.nil?

    text.chars.map do |char|
      rp = TranslitArr[char.downcase]
      if rp 
        char == char.upcase ? rp.capitalize : rp
      else
        char
      end
    end.join
  end

  #латиница- кирилица
  def self.reverse_translit(text)
    return "" if text.nil?

    text.chars.map do |char|
      rp = REVERSE_MAP[char.downcase]

      if rp
        char == char.upcase ? rp.upcase : rp
      else
        char
      end
    end.join
  end
#нормализация текста
  def self.normalize(text)
    return "" if text.nil?

    text
      .downcase
      .gsub(/[^a-zа-яё\s]/i, '')  # убираем всё кроме букв и пробелов
      .strip
  end




end

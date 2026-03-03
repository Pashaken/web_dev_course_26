# frozen_string_literal: true

require_relative "mygem/version"

module Mygem
  class Error < StandardError; end
  TranslitArr = { 'а'=>'a','б'=>'b','в'=>'v','г'=> 'g','д'=>'d','е'=>'e','ё'=>'e','ж'=> 'zh','з'=>'z',
  'и'=>'i','й'=>'y','к'=> 'k','л'=>'l','м'=>'m','н'=>'n','о'=> 'o','п'=>'p','р'=>'r','с'=>'s','т'=> 't',
  'у'=>'u','ф'=>'f','х'=>'h','ч'=> 'ch','ш'=>'sh','щ'=>'sha','ъ'=>'','ы'=> 'i','ь'=>'',
  'э'=>'e','ю'=>'iu','я'=> 'ya','ц'=> 'ts'}.freeze

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
end

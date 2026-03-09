require 'minitest/autorun'
$LOAD_PATH.unshift File.expand_path('../lib', __dir__)
require 'mygem'

class TestMygem < Minitest::Test
  def test_that_it_translite
    assert_equal 'Privet', Mygem.translit('Привет')
    assert_equal 'konets', Mygem.translit('конец')
    assert_equal 'BLIN', Mygem.translit('БЛИН')
  end

  def test_non_cyrilik_char
    assert_equal 'Hello my friend!123', Mygem.translit('Hello my friend!123')
    assert_equal 'NOT MEAN', Mygem.translit('NOT MEAN')
    assert_equal 'yes', Mygem.translit('yes')
  end

  def test_mixed_char
    assert_equal 'Privet man', Mygem.translit('Привет man')
    assert_equal 'Yablonya cool', Mygem.translit('Яблоnya cooл')
    assert_equal 'just posmotri', Mygem.translit('just посмотри')
  end

  def test_non_char
    assert_equal '', Mygem.translit(nil)
    assert_equal '', Mygem.translit('')
  end

  def test_mixed_case
    assert_equal 'Privet', Mygem.translit('Привет')
    assert_equal 'PrIvEt', Mygem.translit('ПрИвЕт')
    assert_equal 'PRIVET', Mygem.translit('ПРИВЕТ')
  end

  def test_spaces
    assert_equal 'Privet mir', Mygem.translit('Привет мир')
    assert_equal '  Privet  ', Mygem.translit('  Привет  ')
  end

  def test_punctuation
    assert_equal 'Privet, kak dela?', Mygem.translit('Привет, как дела?')
    assert_equal 'Privet!', Mygem.translit('Привет!')
    assert_equal '(Privet)', Mygem.translit('(Привет)')
  end

  def test_numbers
    assert_equal 'Privet 123', Mygem.translit('Привет 123')
    assert_equal '2026 god', Mygem.translit('2026 год')
  end

  def test_special_symbols
    assert_equal '@Privet#', Mygem.translit('@Привет#')
    assert_equal '$Privet$', Mygem.translit('$Привет$')
  end

  def test_unicode
    assert_equal 'Privet 😀', Mygem.translit('Привет 😀')
  end

  def test_all_char
    assert_equal 'abvgdeezhziyklmnoprstufhtschshshaieiuya', Mygem.translit('абвгдеёжзийклмнопрстуфхцчшщъыьэюя')
  end
end

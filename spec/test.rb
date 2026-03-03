require "minitest/autorun"
require "mygem"

class TestMygem < Minitest::Test
  def test_that_it_translite
    assert_equal "Privet", Mygem.translit("Привет")
    assert_equal "konets",Mygem.translit("конец")
    assert_equal "BLIN",Mygem.translit("БЛИН")
  end

  def test_non_cyrilik_char
    assert_equal "Hello my friend!123",Mygem.translit("Hello my friend!123")
    assert_equal "NOT MEAN",Mygem.translit("NOT MEAN")
    assert_equal "yes",Mygem.translit("yes")
  end

  def test_mixed_char
    assert_equal "Privet man",Mygem.translit("Привет man")
    assert_equal "Yablonya cool",Mygem.translit("Яблоnya cooл")
    assert_equal "just posmotri",Mygem.translit("just посмотри")
  end

  def test_non_char 
    assert_equal "",Mygem.translit(nil)
    assert_equal "",Mygem.translit("")
  end

  def test_all_char
    assert_equal "abvgdeezhziyklmnoprstufhtschshshaieiuya",Mygem.translit("абвгдеёжзийклмнопрстуфхцчшщъыьэюя")
  end
end
require "./lib/IF.rb"
require "test/unit"

class TestIF < Test::Unit::TestCase
  def test_class()
    puts "testing...IF"
    assert_equal('IF', 'I'+'F')
  end

end
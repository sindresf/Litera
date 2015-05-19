require "./lib/Literate.rb"
require "test/unit"

class TestLiterate < Test::Unit::TestCase
  def test_class()
    puts "testing...Literate"
    assert_equal('Literate', 'Lit'+'era'+'te')
  end

end
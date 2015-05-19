require "./lib/AI.rb"
require "test/unit"

class TestAI < Test::Unit::TestCase
  def test_class()
    puts "testing...AI"
    assert_equal('AI', 'A'+'I')
  end

end
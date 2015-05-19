require "./lib/Player.rb"
require "test/unit"

class TestPlayer < Test::Unit::TestCase
  def test_class()
    puts "testing...Player"
    assert_equal('Player', 'Play'+'er')
  end

end
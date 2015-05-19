require "./lib/Character.rb"
require "test/unit"

class TestCharacter < Test::Unit::TestCase
  def test_class()
    puts "testing...Character"
    assert_equal('Character', 'Char'+'act'+'er')

    test_char = Character.new('a', 1, 0.5, 0.4, 0.5)
    assert_equal('a',test_char.name)
    assert_equal('a',test_char.name) #TODO make rarity calc test
    assert_equal('a',test_char.name) #TODO make pron calc test
    assert_equal('a',test_char.name) #TODO make memo calc test
    assert_equal('a',test_char.name) #TODO make ratio calc test
  end

end
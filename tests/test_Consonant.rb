require "./lib/Consonant.rb"
require "test/unit"

class TestConsonant < Test::Unit::TestCase
  def test_class()
    puts "testing...Consonant"
    assert_equal('Consonant', 'Con'+'son'+'ant')

    # FIRST INDEX
    test_consonant1 = Consonant.new('t', 1, 0.4, 0.65, 0.75)
    assert_equal('t',test_consonant1.name)
    assert_equal('t',test_consonant1.name) #TODO make rarity calc test
    assert_equal('t',test_consonant1.name) #TODO make pron calc test
    assert_equal('t',test_consonant1.name) #TODO make memo calc test
    assert_equal('t',test_consonant1.name) #TODO make ratio calc test

    # SECOND INDEX
    test_consonant2 = Consonant.new('q', 2, 0.4, 0.65, 0.75)
    assert_equal('q',test_consonant2.name)
    assert_equal('q',test_consonant2.name) #TODO make rarity calc test
    assert_equal('q',test_consonant2.name) #TODO make pron calc test
    assert_equal('q',test_consonant2.name) #TODO make memo calc test
    assert_equal('q',test_consonant2.name) #TODO make ratio calc test
  end

end
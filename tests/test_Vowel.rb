require "./lib/Vowel.rb"
require "test/unit"

class TestVowel < Test::Unit::TestCase
  def test_class()
    puts "testing...Vowel"
    assert_equal('Vowel', 'Vo'+'wel')

    # FIRST INDEX
    test_vowel1 = Vowel.new('o', 1, 0.6, 0.6, 0.9)
    assert_equal('o',test_vowel1.name)
    assert_equal('o',test_vowel1.name) #TODO make rarity calc test
    assert_equal('o',test_vowel1.name) #TODO make pron calc test
    assert_equal('o',test_vowel1.name) #TODO make memo calc test
    assert_equal('o',test_vowel1.name) #TODO make ratio calc test

    # SECOND INDEX
    test_vowel2 = Vowel.new('e', 2, 0.6, 0.6, 0.9)
    assert_equal('e',test_vowel2.name)
    assert_equal('e',test_vowel2.name) #TODO make rarity calc test
    assert_equal('e',test_vowel2.name) #TODO make pron calc test
    assert_equal('e',test_vowel2.name) #TODO make memo calc test
    assert_equal('e',test_vowel2.name) #TODO make ratio calc test
  end

end
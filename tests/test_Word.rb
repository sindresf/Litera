require "./lib/Word.rb"
require "test/unit"

class TestWord < Test::Unit::TestCase
  def test_Class()
    puts "testing...Word"
    assert_equal('Word', 'Wo'+'rd')

  end

  def test_Test_word()
    puts "\ttesting...Test-Word"
    test_word = Word.new("test", 'e', 'tst', 1)
    tw_spelling = test_word.spelling
    assert_equal("test",tw_spelling)

    tw_vowels = test_word.vowels
    assert_equal('e',tw_vowels)

    tw_cons = test_word.consonants
    assert_equal('tst',tw_cons)

    # TODO calculate these, so tests can be made
    tw_rar = test_word.rarity
    tw_pro = test_word.pronunciation
    tw_mem = test_word.memory_cost
    tw_ratio = test_word.ratio
  end

  def test_Vowel_word()
    puts "\ttesting...Vowel-Word"
    vow_word = Word.new("aeiotes", 'aeioe', 'ts', 1)
    vw_spelling = vow_word.spelling
    assert_equal("aeiotes",vw_spelling)

    vw_vowels = vow_word.vowels
    assert_equal('aeioe',vw_vowels)

    vw_cons = vow_word.consonants
    assert_equal('ts',vw_cons)

    # TODO calculate these, so tests can be made
    vw_rar = vow_word.rarity
    vw_pro = vow_word.pronunciation
    vw_mem = vow_word.memory_cost
    vw_ratio = vow_word.ratio
  end

  def test_cons_word()
    puts "\ttesting...Consonant-Word"
    cons_word = Word.new("trackback", 'aa', 'trckbck', 2)
    cw_spelling = cons_word.spelling
    assert_equal("trackback",cw_spelling)

    cw_vowels = cons_word.vowels
    assert_equal('aa',cw_vowels)

    cw_cons = cons_word.consonants
    assert_equal('trckbck',cw_cons)

    # TODO calculate these, so tests can be made
    cw_rar = cons_word.rarity
    cw_pro = cons_word.pronunciation
    cw_mem = cons_word.memory_cost
    cw_ratio = cons_word.ratio
  end

  def test_balanced_word()
    puts "\ttesting...Balanced-Word"
    bal_word = Word.new("atesitob", 'aeio', 'tstb', 4)
    bw_spelling = bal_word.spelling
    assert_equal("atesitob",bw_spelling)

    bw_vowels = bal_word.vowels
    assert_equal('aeio',bw_vowels)

    bw_cons = bal_word.consonants
    assert_equal('tstb',bw_cons)

    # TODO calculate these, so tests can be made
    bw_rar = bal_word.rarity
    bw_pro = bal_word.pronunciation
    bw_mem = bal_word.memory_cost
    bw_ratio = bal_word.ratio
  end
end
require "./lib/Word.rb"
require "test/unit"

# TODO should make some handling tests
class TestWord < Test::Unit::TestCase
  def test_Class()
    puts "testing...Word"
    assert_equal('Word', 'Wo' + 'rd')

  end

  def innertest_rarity(word, index)
    # STEPS OF RARITY TEST

    # test with no vowels
    rarity_fun = ((@length * 2.43 + @index_coefficient).round 2)
    rarity_calc = word.calc_attrib 'rar'
    assert_equal(rarity_fun, rarity_calc)
    assert_equal(rarity_calc, word.rarity)

    # test with vowels
    rarity_fun = (((@length * (2.7 / @vowels.length)) * 0.9 + @index_coefficient).round 2)
    rarity_calc = word.calc_attrib 'rar'
    assert_equal(rarity_fun, rarity_calc)
    assert_equal(rarity_calc, word.rarity)
    return rarity_fun
  end

  def innertest_pronunciation(word, index)
    # STEPS OF PRONUNCIATION TEST

    # test with no consonants
    pronunciation_fun = ((@length * 1.74 + @index_coefficient).round 2)
    pronunciation_calc = word.calc_attrib 'pro'
    assert_equal(pronunciation_fun, pronunciation_calc)
    assert_equal(pronunciation_calc, word.pronunciation)

    # test with consonants
    pronunciation_fun = (((@length * (2.9 / @consonants.length)) * 0.6 + @index_coefficient).round 2)
    pronunciation_calc = word.calc_attrib 'pro'
    assert_equal(pronunciation_fun, pronunciation_calc)
    assert_equal(pronunciation_calc, word.pronunciation)
    return pronunciation_fun
  end

  def innertest_memory_cost(word, index)
    # STEPS OF MEMORY COST TEST
    # TODO MAKE TEST CHECK HANDLING
    mem_fun = ((1.47 * @length + @index_coefficient).round 2)
    mem_calc = word.calc_attrib 'mem'
    assert_equal(mem_fun, mem_calc)
    assert_equal(mem_calc, word.memory_cost)
    return mem_fun
  end

  def test_Test_word()
    puts "\ttesting...Test-Word"
    test_word = Word.new("test", 'e', 'tst', 1)
    tw_spelling = test_word.spelling
    assert_equal("test", tw_spelling)

    tw_vowels = test_word.vowels
    assert_equal('e', tw_vowels)

    tw_cons = test_word.consonants
    assert_equal('tst', tw_cons)

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
    assert_equal("aeiotes", vw_spelling)

    vw_vowels = vow_word.vowels
    assert_equal('aeioe', vw_vowels)

    vw_cons = vow_word.consonants
    assert_equal('ts', vw_cons)

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
    assert_equal("trackback", cw_spelling)

    cw_vowels = cons_word.vowels
    assert_equal('aa', cw_vowels)

    cw_cons = cons_word.consonants
    assert_equal('trckbck', cw_cons)

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
    assert_equal("atesitob", bw_spelling)

    bw_vowels = bal_word.vowels
    assert_equal('aeio', bw_vowels)

    bw_cons = bal_word.consonants
    assert_equal('tstb', bw_cons)

    # TODO calculate these, so tests can be made
    bw_rar = bal_word.rarity
    bw_pro = bal_word.pronunciation
    bw_mem = bal_word.memory_cost
    bw_ratio = bal_word.ratio
  end
end
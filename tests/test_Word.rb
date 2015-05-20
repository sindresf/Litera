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
    test_word = Word.new(word.spelling, '', word.consonants, index)
    rarity_fun = ((test_word.spelling.length * 2.43 + (index * 0.25)).round 2)
    rarity_calc = test_word.calc_attrib 'rar'
    assert_equal(rarity_fun, rarity_calc)
    assert_equal(rarity_calc, test_word.rarity)

    # test with vowels
    rarity_fun = (((word.spelling.length * (2.7 / word.vowels.length)) * 0.9 + (index * 0.25)).round 2)
    rarity_calc = word.calc_attrib 'rar'
    assert_equal(rarity_fun, rarity_calc)
    assert_equal(rarity_calc, word.rarity)
    return rarity_fun
  end

  def innertest_pronunciation(word, index)
    # STEPS OF PRONUNCIATION TEST

    # test with no consonants
    test_word = Word.new(word.spelling, word.vowels, '', index)
    pronunciation_fun = ((test_word.spelling.length * 1.74 + (index * 0.25)).round 2)
    pronunciation_calc = test_word.calc_attrib 'pro'
    assert_equal(pronunciation_fun, pronunciation_calc)
    assert_equal(pronunciation_calc, test_word.pronunciation)

    # test with consonants
    pronunciation_fun = (((word.spelling.length * (2.9 / word.consonants.length)) * 0.6 + (index * 0.25)).round 2)
    pronunciation_calc = word.calc_attrib 'pro'
    assert_equal(pronunciation_fun, pronunciation_calc)
    assert_equal(pronunciation_calc, word.pronunciation)
    return pronunciation_fun
  end

  def innertest_memory_cost(word, index)
    # STEPS OF MEMORY COST TEST
    # TODO MAKE TEST CHECK HANDLING
    mem_fun = ((1.47 * word.spelling.length + (index * 0.25)).round 2)
    mem_calc = word.calc_attrib 'mem'
    assert_equal(mem_fun, mem_calc)
    assert_equal(mem_calc, word.memory_cost)
    return mem_fun
  end

  def test_Test_word()
    puts "\ttesting...Test-Word"
    index = 1
    test_word = Word.new("test", 'e', 'tst', index)
    tw_spelling = test_word.spelling
    assert_equal("test", tw_spelling)

    tw_vowels = test_word.vowels
    assert_equal('e', tw_vowels)

    tw_cons = test_word.consonants
    assert_equal('tst', tw_cons)

    tw_rar = innertest_rarity(test_word, index)
    tw_pro = innertest_pronunciation(test_word, index)
    tw_mem = innertest_memory_cost(test_word, index)
    tw_ratio = (tw_mem / (tw_rar + tw_pro)).round 2
    assert_equal(tw_ratio,test_word.ratio)
  end

  def test_Vowel_word()
    puts "\ttesting...Vowel-Word"
    index = 1
    vow_word = Word.new("aeiotes", 'aeioe', 'ts', index)
    vw_spelling = vow_word.spelling
    assert_equal("aeiotes", vw_spelling)

    vw_vowels = vow_word.vowels
    assert_equal('aeioe', vw_vowels)

    vw_cons = vow_word.consonants
    assert_equal('ts', vw_cons)

    vw_rar = innertest_rarity(vow_word, index)
    vw_pro = innertest_pronunciation(vow_word, index)
    vw_mem = innertest_memory_cost(vow_word, index)
    vw_ratio = (vw_mem / (vw_rar + vw_pro)).round 2
    assert_equal(vw_ratio,vow_word.ratio)
  end

  def test_cons_word()
    puts "\ttesting...Consonant-Word"
    index = 2
    cons_word = Word.new("trackback", 'aa', 'trckbck', index)
    cw_spelling = cons_word.spelling
    assert_equal("trackback", cw_spelling)

    cw_vowels = cons_word.vowels
    assert_equal('aa', cw_vowels)

    cw_cons = cons_word.consonants
    assert_equal('trckbck', cw_cons)

    cw_rar = innertest_rarity(cons_word, index)
    cw_pro = innertest_pronunciation(cons_word, index)
    cw_mem = innertest_memory_cost(cons_word, index)
    cw_ratio = (cw_mem / (cw_rar + cw_pro)).round 2
    assert_equal(cw_ratio,cons_word.ratio)
  end

  def test_balanced_word()
    puts "\ttesting...Balanced-Word"
    index = 4
    bal_word = Word.new("atesitob", 'aeio', 'tstb', index)
    bw_spelling = bal_word.spelling
    assert_equal("atesitob", bw_spelling)

    bw_vowels = bal_word.vowels
    assert_equal('aeio', bw_vowels)

    bw_cons = bal_word.consonants
    assert_equal('tstb', bw_cons)

    bw_rar = innertest_rarity(bal_word, index)
    bw_pro = innertest_pronunciation(bal_word, index)
    bw_mem = innertest_memory_cost(bal_word, index)
    bw_ratio = (bw_mem / (bw_rar + bw_pro)).round 2
    assert_equal(bw_ratio,bal_word.ratio)
  end
end
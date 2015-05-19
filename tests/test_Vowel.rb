require "./lib/Vowel.rb"
require "test/unit"

class TestVowel < Test::Unit::TestCase
  def setup
    @@rar_i_pl = 0.12
    @@pro_i_pl = 0.08
    @@mem_i_pl = 2.18

    @@vowel_rar_infl = 0.75
    @@vowel_pro_infl = 0.6
    @@vowel_mem_infl = 0.9
  end

  def test_Class()
    puts "testing...Vowel"
    assert_equal('Vowel', 'Vo'+'wel')

    # ((@@index * rar_amount * type_influence).round 2)
  end

  def innertest_rarity(vowel, index)
    # STEPS OF RARITY TEST
    # TODO MAKE TEST CHECK HANDLING
    rarity_fun = ((index * (index+@@rar_i_pl) * @@vowel_rar_infl).round 2)
    rarity_calc = vowel.calc_rar(index+@@rar_i_pl,@@vowel_rar_infl)
    assert_equal(rarity_fun,rarity_calc)
    assert_equal(rarity_calc,vowel.rarity)
    return rarity_fun
  end

  def innertest_pronunciation(vowel, index)
    # STEPS OF PRONUNCIATION TEST
    # TODO MAKE TEST CHECK HANDLING
    pro_fun = ((index * (index+@@pro_i_pl) * @@vowel_pro_infl).round 2)
    pro_calc = vowel.calc_pro(index+@@pro_i_pl,@@vowel_pro_infl)
    assert_equal(pro_fun,pro_calc)
    assert_equal(pro_calc,vowel.pronunciation)
    return pro_fun
  end

  def innertest_memory_cost(vowel,index)
    # STEPS OF MEMORY COST TEST
    # TODO MAKE TEST CHECK HANDLING
    mem_fun = ((index * (index+@@mem_i_pl) * @@vowel_mem_infl).round 2)
    mem_calc = vowel.calc_mem(index+@@mem_i_pl,@@vowel_mem_infl)
    assert_equal(mem_fun,mem_calc)
    assert_equal(mem_calc,vowel.memory_cost)
    return mem_fun
  end

  def test_first_index_vowel()
    puts "\ttesting...first_index_vowel"
    index = 1
    test_vowel1 = Vowel.new('o', index)
    assert_equal('o',test_vowel1.name)

    rarity_fun = innertest_rarity(test_vowel1,index)
    pro_fun = innertest_pronunciation(test_vowel1,index)
    mem_fun = innertest_memory_cost(test_vowel1,index)

    # RATIO CALC TEST
    ratio = (mem_fun/(rarity_fun + pro_fun)).round 2
    assert_equal(ratio,test_vowel1.ratio)
  end

  def test_second_index_vowel()
    puts "\ttesting...second_index_vowel"
    index = 2
    test_vowel2 = Vowel.new('e', index)
    assert_equal('e',test_vowel2.name)

    rarity_fun = innertest_rarity(test_vowel2,index)
    pro_fun = innertest_pronunciation(test_vowel2,index)
    mem_fun = innertest_memory_cost(test_vowel2,index)

    # RATIO CALC TEST
    ratio = (mem_fun/(rarity_fun + pro_fun)).round 2
    assert_equal(ratio,test_vowel2.ratio)
  end

end
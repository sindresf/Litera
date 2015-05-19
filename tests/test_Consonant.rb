require "./lib/Consonant.rb"
require "test/unit"

class TestConsonant < Test::Unit::TestCase
  def setup
    @@rar_i_pl = 0.12
    @@pro_i_pl = 0.08
    @@mem_i_pl = 2.18

    @@consonant_rar_infl = 0.45
    @@consonant_pro_infl = 0.65
    @@consonant_mem_infl = 0.7
  end

  def test_class()
    puts "testing...Consonant"
    assert_equal('Consonant', 'Con'+'son'+'ant')
  end

  def innertest_rarity(consonant, index)
    # STEPS OF RARITY TEST
    # TODO MAKE TEST CHECK HANDLING
    rarity_fun = ((index * (index+@@rar_i_pl) * @@consonant_rar_infl).round 2)
    rarity_calc = consonant.calc_rar(index+@@rar_i_pl,@@consonant_rar_infl)
    assert_equal(rarity_fun,rarity_calc)
    assert_equal(rarity_calc,consonant.rarity)
    return rarity_fun
  end

  def innertest_pronunciation(consonant, index)
    # STEPS OF PRONUNCIATION TEST
    # TODO MAKE TEST CHECK HANDLING
    pro_fun = ((index * (index+@@pro_i_pl) * @@consonant_pro_infl).round 2)
    pro_calc = consonant.calc_pro(index+@@pro_i_pl,@@consonant_pro_infl)
    assert_equal(pro_fun,pro_calc)
    assert_equal(pro_calc,consonant.pronunciation)
    return pro_fun
  end

  def innertest_memory_cost(consonant,index)
    # STEPS OF MEMORY COST TEST
    # TODO MAKE TEST CHECK HANDLING
    mem_fun = ((index * (index+@@mem_i_pl) * @@consonant_mem_infl).round 2)
    mem_calc = consonant.calc_mem(index+@@mem_i_pl,@@consonant_mem_infl)
    assert_equal(mem_fun,mem_calc)
    assert_equal(mem_calc,consonant.memory_cost)
    return mem_fun
  end

  def test_first_index_consonant()
    puts "\ttesting...first_index_consonant"
    index = 1
    test_consonant1 = Consonant.new('t', index)
    assert_equal('t',test_consonant1.name)

    rarity_fun = innertest_rarity(test_consonant1,index)
    pro_fun = innertest_pronunciation(test_consonant1,index)
    mem_fun = innertest_memory_cost(test_consonant1,index)

    # RATIO CALC TEST
    ratio = (mem_fun/(rarity_fun + pro_fun)).round 2
    assert_equal(ratio,test_consonant1.ratio)
  end

  def test_second_index_consonant()
    puts "\ttesting...second_index_consonant"
    index = 2
    test_consonant2 = Consonant.new('q', index)
    assert_equal('q',test_consonant2.name)

    rarity_fun = innertest_rarity(test_consonant2,index)
    pro_fun = innertest_pronunciation(test_consonant2,index)
    mem_fun = innertest_memory_cost(test_consonant2,index)

    # RATIO CALC TEST
    ratio = (mem_fun/(rarity_fun + pro_fun)).round 2
    assert_equal(ratio,test_consonant2.ratio)
  end

end
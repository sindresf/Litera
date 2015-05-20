require "./lib/Character.rb"
require "test/unit"

class TestCharacter < Test::Unit::TestCase
  def setup
    @@rar_i_pl = 0.12
    @@pro_i_pl = 0.08
    @@mem_i_pl = 2.18

    @@character_rar_infl = 0.5
    @@character_pro_infl = 0.5
    @@character_mem_infl = 0.8
  end

  def test_Class()
    puts "testing...Character"
    assert_equal('Character', 'Char' + 'act' + 'er')
  end

  def innertest_rarity(character, index)
    # STEPS OF RARITY TEST
    # TODO MAKE TEST CHECK HANDLING
    rarity_fun = ((index * (index+@@rar_i_pl) * @@character_rar_infl).round 2)
    rarity_calc = character.calc_rar(index+@@rar_i_pl, @@character_rar_infl)
    assert_equal(rarity_fun, rarity_calc)
    assert_equal(rarity_calc, character.rarity)
    return rarity_fun
  end

  def innertest_pronunciation(character, index)
    # STEPS OF PRONUNCIATION TEST
    # TODO MAKE TEST CHECK HANDLING
    pro_fun = ((index * (index+@@pro_i_pl) * @@character_pro_infl).round 2)
    pro_calc = character.calc_pro(index+@@pro_i_pl, @@character_pro_infl)
    assert_equal(pro_fun, pro_calc)
    assert_equal(pro_calc, character.pronunciation)
    return pro_fun
  end

  def innertest_memory_cost(character, index)
    # STEPS OF MEMORY COST TEST
    # TODO MAKE TEST CHECK HANDLING
    mem_fun = ((index * (index+@@mem_i_pl) * @@character_mem_infl).round 2)
    mem_calc = character.calc_mem(index+@@mem_i_pl, @@character_mem_infl)
    assert_equal(mem_fun, mem_calc)
    assert_equal(mem_calc, character.memory_cost)
    return mem_fun
  end

  def test_no_infl_char()
    puts "\ttesting...'no_infl_char'"
    index = 1
    test_char = Character.new('a', index, 0.5, 0.5, 0.8)
    assert_equal('a', test_char.name)

    rarity_fun = ((index * (index+@@rar_i_pl) * @@character_rar_infl).round 2)
    rarity_calc = test_char.calc_rar(index+@@rar_i_pl)
    assert_equal(rarity_fun, rarity_calc)
    assert_equal(rarity_calc, test_char.rarity)

    pro_fun = ((index * (index+@@pro_i_pl) * @@character_pro_infl).round 2)
    pro_calc = test_char.calc_pro(index+@@pro_i_pl)
    assert_equal(pro_fun, pro_calc)
    assert_equal(pro_calc, test_char.pronunciation)

    mem_fun = ((index * (index+@@mem_i_pl) * @@character_mem_infl).round 2)
    mem_calc = test_char.calc_mem(index+@@mem_i_pl)
    assert_equal(mem_fun, mem_calc)
    assert_equal(mem_calc, test_char.memory_cost)

    # RATIO CALC TEST
    ratio = (mem_fun / (rarity_fun + pro_fun)).round 2
    assert_equal(ratio, test_char.ratio)
  end

  def test_with_infl_char()
    puts "\ttesting...'with_infl_char'"
    index = 1
    test_char = Character.new('a', index, 0.5, 0.5, 0.8)
    assert_equal('a', test_char.name)

    rarity_fun = innertest_rarity(test_char, index)
    pro_fun = innertest_pronunciation(test_char, index)
    mem_fun = innertest_memory_cost(test_char, index)

    # RATIO CALC TEST
    ratio = (mem_fun / (rarity_fun + pro_fun)).round 2
    assert_equal(ratio, test_char.ratio)
  end

end
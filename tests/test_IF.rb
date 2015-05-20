require "./lib/IF.rb"
require "test/unit"

class TestIF < Test::Unit::TestCase
  def test_Class()
    puts "testing...IF"
    assert_equal('IF', 'I'+'F')
  end

  def test_is_a_sending_opt()
    puts "\ttesting...'is_a_sending_opt'"
    opts = ['a'] #the player's sending options (units)
    arg = ''

    #no arg test (should return false BEFORE opts not respond to each)
    assert_false(IF.is_a_sending_opt?(opts, arg))

    #simplest positive options test
    arg = 'a'
    assert_true(IF.is_a_sending_opt?(opts, arg))

    #simplest negative options test
    arg = 'r'
    assert_false(IF.is_a_sending_opt?(opts,arg))

    #contains positive test
    opts.push('t', 'r', 'e', 'o', 'test')
    assert_true(IF.is_a_sending_opt?(opts,arg))

    #contains negative test
    arg = 'n'
    assert_false(IF.is_a_sending_opt?(opts,arg))

    #contains word positive test
    arg = 'test'
    assert_true(IF.is_a_sending_opt?(opts,arg))

    #contains word negative test
    arg = 'negative'
    assert_false(IF.is_a_sending_opt?(opts,arg))

    #contains sneeky close test
    arg = 'test '
    assert_false(IF.is_a_sending_opt?(opts,arg))
    arg = ' test'
    assert_false(IF.is_a_sending_opt?(opts,arg))
    arg = ' '
    assert_false(IF.is_a_sending_opt?(opts,arg))
    arg = 'o '
    assert_false(IF.is_a_sending_opt?(opts,arg))

  end

  def test_is_info_arg()
    puts "\ttesting...'is_info_arg'"

    #no arg test
    arg = ''
    assert_false(IF.is_info_arg?(arg))

    #correct includes tests
    arg = '-v'
    assert_true(IF.is_info_arg?(arg))
    arg = '-c'
    assert_true(IF.is_info_arg?(arg))
    arg = '-w'
    assert_true(IF.is_info_arg?(arg))

    #simple include tests
    arg = 'v'
    assert_false(IF.is_info_arg?(arg))
    arg = 'c'
    assert_false(IF.is_info_arg?(arg))
    arg = 'w'
    assert_false(IF.is_info_arg?(arg))

    #several options in arg tests
    arg = '-v-w'
    assert_false(IF.is_info_arg?(arg))
    arg = '-c-w'
    assert_false(IF.is_info_arg?(arg))
    arg = '-c-'
    assert_false(IF.is_info_arg?(arg))
  end

  def test_cAn_kill()
    puts "\ttesting...'can_kill'"

    #nil tests
    attacker = Character.new('a',1,1,1,1)
    defender = nil
    assert_true(IF.can_kill?(attacker, defender))
    attacker = nil
    defender = Character.new('a',1,1,1,1)
    assert_false(IF.can_kill?(attacker, defender))
    attacker = nil
    defender = nil
    assert_false(IF.can_kill?(attacker, defender))

    #true tests
    attacker = Character.new('a',1,1,1.2,1)
    defender = Character.new('a',1,1,1,1)
    assert_true(IF.can_kill?(attacker, defender))
    attacker = Character.new('a',2,1,1,1)
    assert_true(IF.can_kill?(attacker, defender))
    defender = Character.new('a',1,0.9,1,1)
    assert_true(IF.can_kill?(attacker, defender))
    attacker = Character.new('a',1,1,1.1,1)
    defender = Character.new('a',1,1,1,1)
    assert_true(IF.can_kill?(attacker, defender))
    attacker = Character.new('a',2,1,1.1,1) #scales more on index than life
    defender = Character.new('a',1,2,1,1)
    assert_true(IF.can_kill?(attacker, defender))

    #false tests
    attacker = Character.new('a',1,1,1,1) #because they get more life than attack
    defender = Character.new('a',1,1,1,1)
    assert_false(IF.can_kill?(attacker, defender))
    attacker = Character.new('a',1,1,1.2,1)
    defender = Character.new('a',1,1.2,1,1)
    assert_false(IF.can_kill?(attacker, defender))
    attacker = Character.new('a',2,1,0.5,1)
    defender = Character.new('a',1,2,1,1)
    assert_false(IF.can_kill?(attacker, defender))
  end

  def test_cAn_survive()
    puts "\ttesting...'can'survive'"
    #nil tests
    attacker = Character.new('a',1,1,1,1)
    defender = nil
    assert_false(IF.can_survive?(defender, attacker))
    attacker = nil
    defender = Character.new('a',1,1,1,1)
    assert_true(IF.can_survive?(defender, attacker))
    attacker = nil
    defender = nil
    assert_false(IF.can_survive?(defender, attacker))

    #true tests
    attacker = Character.new('a',1,1,1,1)
    defender = Character.new('a',1,1,1,1)
    assert_true(IF.can_survive?(defender, attacker))
    attacker = Character.new('a',2,1,1,1)
    defender = Character.new('a',2,1,1,1)
    assert_true(IF.can_survive?(defender, attacker))
    defender = Character.new('a',1,4,1,1)
    assert_true(IF.can_survive?(defender, attacker))
    attacker = Character.new('a',1,1,1.1,1)
    defender = Word.new('lol','o','ll',1)
    assert_true(IF.can_survive?(defender, attacker))
    attacker = Word.new('a','a','',1)
    assert_true(IF.can_survive?(defender, attacker))

    #false tests
    attacker = Character.new('a',1,1,1,1) #because they get more life than attack
    defender = Character.new('a',1,0.8,1,1)
    assert_false(IF.can_survive?(defender, attacker))
    attacker = Character.new('a',1,1,1.2,1)
    defender = Character.new('a',1,1,1,1)
    assert_false(IF.can_survive?(defender, attacker))
    attacker = Character.new('a',2,1,1,1)
    defender = Character.new('a',2,0.5,1,1)
    assert_false(IF.can_survive?(defender, attacker))

  end

  def test_caN_kill_and_survive()
    puts "\ttesting...'can_kill_and_survive'"
    # Given that can kill, and can survive is tested and works
    # this will only test the combination

    # nil tests
    # should be false for all attacker nils
    attacker = nil
    defender = Character.new('a',1,1,1,1)
    assert_false(IF.can_kill_and_survive?(attacker,defender))
    defender = nil
    assert_false(IF.can_kill_and_survive?(attacker,defender))
    attacker = Character.new('a',1,1,1,1)
    assert_true(IF.can_kill_and_survive?(attacker,defender))

    # Both have more life than attack, equals should return false (can't kill)
    attacker = Character.new('a',1,1,1,1)
    defender = Character.new('a',1,1,1,1)
    assert_false(IF.can_kill_and_survive?(attacker,defender))
    # But, with everything equal, but more attack, returns true
    attacker = Character.new('a',1,1,1.1,1)
    defender = Character.new('a',1,1,1,1)
    assert_true(IF.can_kill_and_survive?(attacker,defender))

  end

  def test_will_mutually_destruct()
    puts "\ttesting 'will_mutually_destruct'"

    #nil tests
    # if both are nils, then both should 'go away', meaning return true
    attacker = nil
    defender = nil
    assert_true(IF.will_mutually_destruct?(attacker,defender))
    #any other nil should result in someone surviving, return false
    defender = Character.new('a',1,1,1,1)
    assert_false(IF.will_mutually_destruct?(attacker,defender))
    attacker = Character.new('a',1,1,1,1)
    defender = nil
    assert_false(IF.will_mutually_destruct?(attacker,defender))

    # (basic) equals don't kill each other
    defender = Character.new('a',1,1,1,1)
    assert_false(IF.will_mutually_destruct?(attacker,defender))

    # consonant starved words will
    attacker = Word.new('meteoy','eeoy','mt',1)
    defender = Word.new('meteoy','eeoy','mt',1)
    assert_true(IF.will_mutually_destruct?(attacker,defender))

  end

  def test_can_afford()
    puts "\ttesting...'can_afford'"

    #nil tests
    argument = nil
    vocabulary = nil
    #no money
    assert_false(IF.can_afford?(argument,vocabulary))
    #money for nothing
    vocabulary = 0
    assert_true(IF.can_afford?(argument,vocabulary))
    #in debt (not allowed) for nothing
    vocabulary = -0.1
    assert_false(IF.can_afford?(argument,vocabulary))

    #not enough tests
    argument = Character.new('a',1,1,1,1)
    vocabulary = 1
    assert_false(IF.can_afford?(argument,vocabulary))
    argument = Character.new('a',2,1,1,1)
    vocabulary = 3
    assert_false(IF.can_afford?(argument,vocabulary))
    vocabulary = 0
    assert_false(IF.can_afford?(argument,vocabulary))

    #has enough tests
    argument = Character.new('a',1,1,1,1)
    vocabulary = 3.5
    assert_true(IF.can_afford?(argument,vocabulary))
    argument = Character.new('a',2,1,1,1)
    vocabulary = 9
    assert_true(IF.can_afford?(argument,vocabulary))
    argument = Character.new('a',1,1,1,0.1)
    vocabulary = 1
    assert_true(IF.can_afford?(argument,vocabulary))
  end

  def test_both_side_survived()
    puts "\ttesting...'both_side_survived'"
    survivormap = {
      'player' => {},
      'ai' => {}
    }
    #nil test
    hashmap = nil
    assert_false(IF.both_side_survived?(hashmap))

    #empty = no survivors = return false
    assert_false(IF.both_side_survived?(survivormap))

    #only player survivor test
    survivormap.store('player','1')
    assert_false(IF.both_side_survived?(survivormap))
    #only ai survivor test
    survivormap['player'] = {}
    survivormap.store('ai','1')
    assert_false(IF.both_side_survived?(survivormap))

    #has survivors! aka, holds 'something'
    survivormap.store('player','1')
    assert_true(IF.both_side_survived?(survivormap))

  end

end
require "./lib/Arena.rb"
require "test/unit"

class TestArena < Test::Unit::TestCase
  def test_class()
    puts "testing...Arena"
    assert_equal('Arena', 'A' + 'r' + 'e' + 'n' + 'a')
  end

  def test_handle_fight()
    #TODO make sends with known outcome to test
  end

  def test_handle_sends()
    #TODO tests the handling, which incorporates everything
  end

  def test_store_result()
    # TODO nil tests and 'no' tests
  end

  def test_remove_the_dead()
    # TODO make several different dead things in a hashmap
    # TODO START HERE
  end

end
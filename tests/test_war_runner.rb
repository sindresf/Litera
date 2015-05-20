require "./bin/TextWarRunner.rb"
require "test/unit"

#TODO find out how to test this without all the lengthy outputs
# TEST THIS ONE LAST
class TestWarRunner < Test::Unit::TestCase
  def test_sample
    assert_equal(4, 2 + 2)
  end

end
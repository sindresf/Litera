require "./bin/TextWarRunner.rb"
require "test/unit"

class TestWarRunner < Test::Unit::TestCase
  def test_sample
    assert_equal(4, 2+2)
  end

end
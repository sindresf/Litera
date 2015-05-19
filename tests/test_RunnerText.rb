require "./lib/RunnerText.rb"
require "test/unit"

class TestRunnerText < Test::Unit::TestCase
  def test_class()
    puts "testing...RunnerText"
    assert_equal('RunnerText', 'Runner'+'Text')
  end

end
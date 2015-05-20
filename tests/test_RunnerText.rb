require "./lib/RunnerText.rb"
require "test/unit"

# TODO dunno if there is much to test here anyways
class TestRunnerText < Test::Unit::TestCase
  def test_class()
    puts "testing...RunnerText"
    assert_equal('RunnerText', 'Runner' + 'Text')
  end

end
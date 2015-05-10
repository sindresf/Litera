require_relative('literate')

class AI < Literate
  def calc_next_move(situation)
    puts "#{@name} is thinking in #{@language.name}"
    sleep(0.7)
    vowel = @language.vowel(0)
    name = vowel.name
    puts "going for #{name}"
    return name
  end

end

def class_test()
  puts "testing...AI"
end

class_test
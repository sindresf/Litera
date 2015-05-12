require_relative('literate')

class AI < Literate
  def calc_next_move(player_send,round)
    puts "#{@name} is thinking in #{@language.name}"
    sleep(0.7)

    if player_send == " "
      puts "blank player side send"
      return @language.vowel(0).name
    end
    case player_send.index
    when 1
      return @language.vowel(0).name
    when 2
      return @language.vowel(1).name
    else
      return @language.consonant(0).name
    end
  end

end

def class_test()
  puts "testing...AI"
end

#class_test
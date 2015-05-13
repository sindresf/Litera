require_relative('literate')

class AI < Literate
  def calc_next_move(player_send,round)
    (0..2).each do |time|
      print '.'
      sleep(0.8)
    end
    puts '.'
    sleep(0.4)

    if player_send == " "
      puts "blank player side send"
      return @language.vowel(0)
    end
    case player_send.index
    when 1
      return @language.vowel(0)
    when 2
      return @language.consonant(1)
    when 3
      return @language.word(1)
    else
      return @language.consonant(0)
    end
  end

end

def class_test()
  puts "testing...AI"
end

#class_test
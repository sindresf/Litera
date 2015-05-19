require_relative('literate')

class AI < Literate
  @random = Random.new
  def calc_next_move(player_send, round)
    (0..2).each do |time|
      print '.'
      sleep 0.35
    end
    puts '.'
    sleep 0.2
    case player_send.index
    when 1
      @vocabulary = (@vocabulary - @language.vowel(0).memory_cost).round 2
      return @language.vowel(0)
    when 2
      @vocabulary = (@vocabulary - @language.consonant(1).memory_cost).round 2
      return @language.consonant(1)
    when 3
      @vocabulary = (@vocabulary -  @language.word(1).memory_cost).round 2
      return @language.word(1)
    else
      @vocabulary = (@vocabulary -  @language.vowel(0).memory_cost).round2
      return @language.consonant(0)
    end
  end

  def AI.rand_lang()
    nr = @random.rand 3
    case nr
    when 0
      return 'E'
    when 1
      return 'N'
    when 2
      return 'M'

    end
  end

  def AI.rand_upgrade(ai)
    nr = @random.rand 3
    case nr
    when 0
      ai.add("bold")
    when 1
      ai.add("italic")
    when 2
      ai.add("underlined")
    end
  end

end
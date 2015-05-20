class Word
  def initialize( * args) #word,vowels,consonants
    @spelling = args[0]
    @vowels = args[1].split "" #not actual Vowel vowels
    @consonants = args[2].split "" #not actual Consonants consonants
    @index = args[3]
    @index_coefficient = @index * 0.25

    @length =@spelling.length
    @rarity = calc_attrib('rar')
    @pronunciation = calc_attrib('pro')
    @memory_cost= calc_attrib('mem')
    @ratio = (@memory_cost/(@rarity+@pronunciation)).round 2
  end

  def calc_attrib(what_attrib)
    if what_attrib == 'rar'
      if @vowels.length == 0
        return ((@length * 2.43 + @index_coefficient).round 2)
      else
        return (((@length * (2.7/@vowels.length)) * 0.9 + @index_coefficient).round 2)
      end
    elsif what_attrib == 'pro'
      if @consonants.length == 0
        return ((@length * 1.74 + @index_coefficient).round 2)
      else
        return (((@length * (2.9/@consonants.length)) * 0.6 + @index_coefficient).round 2)
      end
    elsif what_attrib == 'mem'
      return ((1.47 * @length + @index_coefficient).round 2)
    end
  end

  def name()
    return @spelling
  end

  def spelling()
    return @spelling
  end

  def vowels()
    return (@vowels.join "")
  end

  def consonants()
    return (@consonants.join "")
  end

  def rarity()
    return @rarity
  end

  def pronunciation()
    return @pronunciation
  end

  def memory_cost()
    return @memory_cost
  end

  def ratio()
    return @ratio
  end

  def index()
    return @index
  end

  def reduce_rarity_by(amount)
    @rarity = (@rarity - amount).round 2
  end

  def info()
    return "'#{@spelling}': Hp.#{@rarity} atk.#{@pronunciation}"
  end
end
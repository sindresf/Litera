require_relative('vowel')
require_relative('consonant')
require_relative('word')

class Language
  def initialize(language, upgrade = 'p') #on the form: languageChar, upgradeChar
    @name = ''
    @vowels = []
    @consonants = []
    @words = []

    if language == 'E' || language == 'e'
      make_English
    elsif language == 'N'|| language == 'n'
      make_Norwegian
    elsif language == 'M'|| language == 'm'
      make_Maori
    else
      make_Binary
    end

    #Upgrades
    #BOLD LANGUAGE
    if upgrade == 'B'
      @bold = true #higher rarity
    else
      @bold = false
    end

    #UNDERLINED LANGUAGE
    if upgrade == 'U'
      @underlined = true #discount
    else
      @underlined = false
    end

    #ITALIC LANGUAGE
    if upgrade == 'I'
      @italic = true #higher attack
    else
      @italic = false
    end
  end

  def make_English()
    @name = "English"
    @vowels = [Vowel.new('a', 1), Vowel.new('e', 2), Vowel.new('u', 3)] # 1.91, 1.32, 1.11 PERFECT RATIO
    @consonants = [Consonant.new('t', 1), Consonant.new('n', 2), Consonant.new('c', 3), Consonant.new('p', 4), Consonant.new('q', 5)]
    @words =  [Word.new('tea', 'ea', 't', 1),
      Word.new('cunt', 'u', 'cnt', 2)]
  end

  def make_Norwegian()
    @name = "Norwegian"
    @vowels = [Vowel.new('a', 1), Vowel.new('e', 2), Vowel.new('u', 3),Vowel.new('å', 4),Vowel.new('ø', 5),Vowel.new('æ', 6)]
    @consonants = [Consonant.new('s', 1), Consonant.new('n', 2), Consonant.new('k', 3), Consonant.new('t', 4)]
    @words = [Word.new('kåt', 'å', 'kt', 1),
      Word.new('snø', 'ø', 'sn', 2),
      Word.new('nattå', 'aå', 'ntt', 3)]
  end

  def make_Maori()
    @name = "Maori"
    @vowels = [Vowel.new('a', 1), Vowel.new('o', 2)]
    @consonants = [Consonant.new('b', 1), Consonant.new('l', 2), Consonant.new('d', 3), Consonant.new('m', 4), Consonant.new('w', 5), Consonant.new('z', 6)]
    @words = [Word.new('ba', 'a', 'b', 1),
      Word.new('omwo', 'oo', 'mw', 2),
      Word.new('lazwo', 'ao', 'lzw', 3),
      Word.new('aowobloa', 'aoooa', 'wbl', 4)]
  end

  def make_Binary()
    @name = "Binary"
    @vowels = [Vowel.new('o', 1)]
    @consonants = [Consonant.new('l', 1)]
    @words = [Word.new('oo', 'oo', '', 1),
      Word.new('ll', '', 'll', 2),
      Word.new('l', '', 'l', 3),
      Word.new('lolololo', 'oooo', 'llll', 4),
      Word.new('oooool', 'ooooo', 'l', 5),
      Word.new('loollo', 'ooo', 'lll', 6)]
  end

  def vowel(index = 0)
    return @vowels[index]
  end

  def vowels()
    return @vowels
  end

  def consonant(index = 0)
    return @consonants[index]
  end

  def consonants()
    return @consonants
  end

  def word(index = 0)
    return @words[index]
  end

  def words()
    return @words
  end

  def name()
    return @name
  end

end
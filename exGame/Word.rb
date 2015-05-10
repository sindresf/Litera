class Word
  def initialize(*args) #word,vowels,consonants
    @spelling = args[0]
    @vowels = args[1].split("") #not actual Vowel vowels
    @consonants = args[2].split("") #not actual Consonants consonants

    @length =@spelling.length
    @rarity = calc_attrib('rar')
    @pronunciation = calc_attrib('pro')
    @memory_cost= calc_attrib('mem')
    @ratio = (@memory_cost/(@rarity+@pronunciation)).round(2)
  end

  def calc_attrib(what_attrib) #TODO to make this make "game-sense" inverse the scaling here
    if what_attrib == 'rar'
      return ((@length*(2.7/@vowels.length))*0.9).round(2)
    elsif what_attrib == 'pro'
      return ((@length*(2.9/@consonants.length))*0.6).round(2)
    elsif what_attrib == 'mem'
      return (1.47*@length).round(2) #TODO this bust be better scalable
    end
  end

  def spelling()
    return @spelling
  end

  def vowels()
    return @vowels.join("")
  end

  def consonants()
    return @consonants.join("")
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
end

def class_test()
  puts "testing...Word"
  test_word = Word.new("test",'e','tst')
  puts "created word 'test'"
  tw_spelling = test_word.spelling
  puts "you spell the word #{test_word}: #{tw_spelling}"
  tw_vowels = test_word.vowels
  puts "test contains the vowel: #{tw_vowels}"
  tw_cons = test_word.consonants
  puts "test contains the cons.: #{tw_cons}"
  tw_rar = test_word.rarity
  tw_pro = test_word.pronunciation
  tw_mem = test_word.memory_cost
  puts "test has rarity:#{tw_rar}, pronunciation:#{tw_pro}, and memory cost:#{tw_mem}"
  tw_ratio = test_word.ratio
  puts "this gives test a ratio of #{tw_ratio}"
  puts " "
  #VOWEL WORD
  vow_word = Word.new("aeiotes",'aeioe','ts')
  puts "created vowel word 'aeiotes'"
  vw_spelling = vow_word.spelling
  puts "you spell the word #{vow_word}: #{vw_spelling}"
  vw_vowels = vow_word.vowels
  puts "aeiotes contains the vowels: #{vw_vowels}"
  vw_cons = vow_word.consonants
  puts "aeiotes contains the cons.: #{vw_cons}"
  vw_rar = vow_word.rarity
  vw_pro = vow_word.pronunciation
  vw_mem = vow_word.memory_cost
  puts "aeiotes has rarity:#{vw_rar}, pronunciation:#{vw_pro}, and memory cost:#{vw_mem}"
  vw_ratio = vow_word.ratio
  puts "this gives aeiotes a ratio of #{vw_ratio}"
  puts " "
  #CONS WORD
  cons_word = Word.new("trackback",'aa','trckbck')
  puts "created consonant word 'trackback'"
  cw_spelling = cons_word.spelling
  puts "you spell the word #{cons_word}: #{cw_spelling}"
  cw_vowels = cons_word.vowels
  puts "trackback contains the vowels: #{cw_vowels}"
  cw_cons = cons_word.consonants
  puts "trackback contains the cons.: #{cw_cons}"
  cw_rar = cons_word.rarity
  cw_pro = cons_word.pronunciation
  cw_mem = cons_word.memory_cost
  puts "trackback has rarity:#{cw_rar}, pronunciation:#{cw_pro}, and memory cost:#{cw_mem}"
  cw_ratio = cons_word.ratio
  puts "this gives trackback a ratio of #{cw_ratio}"
  puts " "
  #BALANCED WORD
  bal_word = Word.new("atesitob",'aeio','tstb')
  puts "created balanced word 'atesitob'"
  bw_spelling = bal_word.spelling
  puts "you spell the word #{bal_word}: #{bw_spelling}"
  bw_vowels = bal_word.vowels
  puts "atesitob contains the vowels: #{bw_vowels}"
  bw_cons = bal_word.consonants
  puts "atesitob contains the cons.: #{bw_cons}"
  bw_rar = bal_word.rarity
  bw_pro = bal_word.pronunciation
  bw_mem = bal_word.memory_cost
  puts "atesitob has rarity:#{bw_rar}, pronunciation:#{bw_pro}, and memory cost:#{bw_mem}"
  bw_ratio = bal_word.ratio
  puts "this gives atesitob a ratio of #{bw_ratio}"
  puts " "
end

#class_test
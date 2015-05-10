require_relative('character')

class Vowel < Character
  def initialize(name, index, rar_type_influence = 0.75, pro_type_influence = 0.6, mem_type_influence = 0.9)
    super(name, index, rar_type_influence, pro_type_influence, mem_type_influence)
  end
end

def class_test()
  puts "testing...Vowel"
  test_vowel = Vowel.new('a',1,0.6,0.6,0.9)
  puts "made a test_vowel: #{test_vowel}"
  tv_name = test_vowel.name
  puts "the vowel's name is: #{tv_name}"
  tv_rarity = test_vowel.rarity
  puts "the vowel's rarity was calc. to: #{tv_rarity}"
  tv_pronunciation = test_vowel.pronunciation
  puts "the vowel's pronunciation was calc. to: #{tv_pronunciation}"
  tv_memory_cost = test_vowel.memory_cost
  puts "the vowel's memory_cost was calc. to: #{tv_memory_cost}"
  puts " "
end

#class_test
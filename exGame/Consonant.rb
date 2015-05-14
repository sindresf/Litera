require_relative('character')

class Consonant < Character
  def initialize(name, index, rar_type_influence = 0.45, pro_type_influence = 0.65, mem_type_influence = 0.7) #name and ordinal index
    super(name, index, rar_type_influence, pro_type_influence, mem_type_influence)
  end
end

def class_test()
  puts "testing...Consonant"
  test_consonant = Consonant.new('t', 1, 0.4, 0.65, 0.75)
  puts "made a test_consonant: #{test_consonant}"
  tc_name = test_consonant.name
  puts "the consonant's name is: #{tc_name}"
  tc_rarity = test_consonant.rarity
  puts "the consonant's rarity was calc. to: #{tc_rarity}"
  tc_pronunciation = test_consonant.pronunciation
  puts "the consonant's pronunciation was calc. to: #{tc_pronunciation}"
  tc_memory_cost = test_consonant.memory_cost
  puts "the consonant's memory_cost was calc. to: #{tc_memory_cost}"
  puts " "
end

#class_test
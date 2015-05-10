class Character
  def initialize(name,index,rar,pro,mem) #name and ordinal index
    @name = name #like 'a' or 'b'
    @index = index #in the list where it's made
    @rarity = calc_rar( @index+0.12,rar) #health
    @pronunciation = calc_pro(@index+0.08,pro) #attack
    @memory_cost = calc_mem( @index+2.18,mem) #price
    @ratio = (@memory_cost/(@rarity+@pronunciation)).round(2)
  end

  def calc_rar(rar_amount = 1, type_influence = 0.5)
    return (@index * rar_amount * type_influence).round(2)
  end

  def calc_pro(pro_amount = 1, type_influence = 0.5)
    return (@index * pro_amount * type_influence).round(2)
  end

  def calc_mem(mem_amount = 2, type_influence = 0.8)
    return (@index * mem_amount * type_influence).round(2)
  end

  def name()
    return @name
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
  puts "testing...Character"
  test_char = Character.new('a',1,0.5,0.4,0.5)
  puts "made a test_char: #{test_char}"
  tc_name = test_char.name
  puts "the char's name is: #{tc_name}"
  tc_rarity = test_char.rarity
  puts "the char's rarity was calc. to: #{tc_rarity}"
  tc_pronunciation = test_char.pronunciation
  puts "the char's pronunciation was calc. to: #{tc_pronunciation}"
  tc_memory_cost = test_char.memory_cost
  puts "the char's memory_cost was calc. to: #{tc_memory_cost}"
  tc_ratio = test_char.ratio
  puts "this gives the char the ratio: #{tc_ratio}"
  puts " "
end

#class_test
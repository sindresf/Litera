class Character
  def initialize(name, index, rar, pro, mem) #name and ordinal index
    @name = name #like 'a' or 'b'
    @index = index #in the list where it's made
    @rarity = calc_rar(@index + 0.12, rar) #health
    @pronunciation = calc_pro(@index + 0.08, pro) #attack
    @memory_cost = calc_mem(@index + 2.18, mem) #price
    @ratio = (@memory_cost/(@rarity + @pronunciation)).round 2
  end

  def calc_rar(rar_amount = 1, type_influence = 0.5)
    return ((@index * rar_amount * type_influence).round 2)
  end

  def calc_pro(pro_amount = 1, type_influence = 0.5)
    return ((@index * pro_amount * type_influence).round 2)
  end

  def calc_mem(mem_amount = 2, type_influence = 0.8)
    return ((@index * mem_amount * type_influence).round 2)
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

  def index()
    return @index
  end

  def reduce_rarity_by(amount)
    @rarity = (@rarity - amount).round 2
  end

  def info()
    return "'#{@name}': Hp.#{@rarity} atk.#{@pronunciation}"
  end

end
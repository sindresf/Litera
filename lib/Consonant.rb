require_relative('character')

class Consonant < Character
  def initialize(name, index, rar_type_influence = 0.45, pro_type_influence = 0.65, mem_type_influence = 0.7) #name and ordinal index
    super(name, index, rar_type_influence, pro_type_influence, mem_type_influence)
  end
end
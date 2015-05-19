require_relative('character')

class Vowel < Character
  def initialize(name, index, rar_type_influence = 0.75, pro_type_influence = 0.6, mem_type_influence = 0.9)
    super(name, index, rar_type_influence, pro_type_influence, mem_type_influence)
  end
end
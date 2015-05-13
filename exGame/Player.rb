require_relative('literate')
require_relative('language')

class Player < Literate
  def set(attribute, value)
    case attribute
    when 'name'
      @name = value
    when 'ego'
      @ego = value
    when 'language'
      @language =  Language.new(value)
    when 'vocabulary'
      @vocabulary = value
    end
  end

  def pay_for(argument)
    puts "ARGUMENT COST = #{argument.memory_cost}"
    @vocabulary -= argument.memory_cost
  end
end

def class_test()
  puts "testing...Player"
end

#class_test
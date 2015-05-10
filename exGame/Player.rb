require_relative('literate')

class Player < Literate
  def set(attribute, value)
    case
    when attribute == 'name'
      @name = value
    when attribute == 'ego'
      @ego = value
    when attribute == 'language'
      @language = value
    when attribute == 'vocabulary'
      @vocabulary = value
    end
  end
end

def class_test()
  puts "testing...Player"
end

class_test
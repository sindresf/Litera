require_relative('language')

class Literate
  def initialize(*args)
    @name = args[0]
    @ego = args[1]
    @vocabulary = args[2]
    @language = Language.new(args[3])
    @upgrade = []
  end

  def add(upgrade)
    @upgrade = upgrade
  end

  def get(attribute)
    case
    when attribute == 'name'
      return @name
    when attribute == 'ego'
      return @ego
    when attribute == 'language'
      return @language
    when attribute == 'vocabulary'
      return @vocabulary
    when attribute == 'upgrade'
      return @upgrade
    end
  end

end

def class_test()
  puts "testing...Literate"
end

#class_test
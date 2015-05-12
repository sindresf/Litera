require_relative('language')

class Literate
  def initialize(*args)
    @name = args[0]
    @ego = args[1]
    @vocabulary = args[2]
    @language = Language.new(args[3])
    @upgrade = []
    @tier = 1
  end

  def add(upgrade)
    @upgrade = upgrade
  end

  def get(attribute)
    case attribute
    when 'name'
      return @name
    when 'ego'
      return @ego
    when 'language'
      return @language
    when 'vocabulary'
      return @vocabulary
    when 'upgrade'
      return @upgrade
    when 'tier'
      return @tier
    end
  end

  def level_up()
    @tier += 1
    broaden_vocabulary(3)
  end

  def broaden_vocabulary(value = 1)
    @vocabulary += value
  end
end

def class_test()
  puts "testing...Literate"
end

#class_test
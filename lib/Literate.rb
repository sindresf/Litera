require_relative('language')

class Literate
  def initialize(*args)
    @name = args[0]
    @ego = args[1]
    @vocabulary = args[2]
    @language = Language.new args[3]
    @upgrade = []
    @tier = 1
  end

  def add(upgrade)
    @upgrade = upgrade
  end

  def name()
    return @name
  end

  def ego()
    return @ego
  end

  def language()
    return @language
  end

  def vocabulary()
    return @vocabulary
  end

  def upgrade()
    return @upgrade
  end

  def tier()
    return @tier
  end

  def level_up()
    @tier += 1
    broaden_vocabulary 3
    open_opt

  end

  def open_opt() #TODO fix this hold level thing

  end

  def broaden_vocabulary(value = 1)
    @vocabulary += value
  end
end
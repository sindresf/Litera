module IF
  def IF.is_a_sending_opt?(opts, arg)
    if arg == ""
      return false
    end
    opts.each do |opt|
      if opt.include? arg
        return true
      end
    end
    return false
  end

  def IF.is_info_arg?(arg)
    info_args = "-v-c-w"
    sep = '-'
    if arg == ""
      return false
    elsif arg.length > 2
      return false
    end
    return (info_args.include? arg and arg.include? sep)
  end

  def self.can_kill?(attacker, defender)
    if attacker  == nil
      return false
    elsif defender == nil
      return true
    end
    return attacker.pronunciation >= defender.rarity
  end

  def self.can_survive?(defender, attacker)
    if defender == nil
      return false
    elsif attacker  == nil
      return true
    end
    return defender.rarity > attacker.pronunciation
  end

  def IF.can_kill_and_survive?(attacker, defender)
    return can_kill?(attacker, defender) && can_survive?(attacker, defender)
  end

  def IF.will_mutually_destruct?(attacker, defender)
    if attacker == nil and defender == nil
      return true
    end
    return can_kill?(attacker, defender) && can_kill?(defender, attacker)
  end

  def IF.can_afford?(argument, vocabulary)
    if vocabulary == nil or vocabulary < 0
      return false
    elsif argument == nil
      return true
    end
    return vocabulary >= argument.memory_cost
  end

  def IF.both_side_survived?(survivors)
    if survivors == nil
      return false
    end
    if(survivors['player'].empty? and survivors['ai'].empty?)
      return false
    elsif survivors['player'].empty?
      return false
    elsif survivors['ai'].empty?
      return false
    else
      return true
    end

  end

end
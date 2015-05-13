module IF
  def IF.is_a_sending_opt?(opts,arg)
    if arg == ""
      return false
    end
    opts.each do |opt|
      if opt.include?(arg)
        return true
      end
    end
    return false
  end

  def IF.is_info_arg?(arg)
    info_args = "-v-c-w"
    if arg == ""
      return false
    end
    return info_args.include?(arg)
  end

  def self.can_kill?(attacker,defender)
    return attacker.pronunciation >= defender.rarity
  end

  def self.can_survive?(defender,attacker)
    return defender.rarity > attacker.pronunciation
  end

  def IF.can_kill_and_survive?(killer,defender)
    return can_kill?(killer,defender) && can_survive?(killer,defender)
  end

  def IF.will_mutually_destruct?(attacker,defender)
    return can_kill?(attacker,defender) && can_kill?(defender,attacker)
  end

  def IF.can_afford?(argument,vocabulary)
    return vocabulary >= argument.memory_cost
  end

end
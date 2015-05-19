require_relative('runnertext')

module Arena
  def Arena.handle_fight(send1, send2)
    if IF.can_kill_and_survive?(send1, send2)
      puts "PLAYER WIN"
      send1.reduce_rarity_by send2.pronunciation
      return 'player'
    elsif IF.will_mutually_destruct?(send1, send2)
      puts "DEATH TIE!"
      return 'none'
    elsif  IF.can_kill_and_survive?(send2, send1)
      puts "AI WIN!"
      send2.reduce_rarity_by send1.pronunciation
      return 'ai'
    elsif !IF.will_mutually_destruct?(send1, send2) # nobody can kill anything
      puts "LIFE TIE!"
      send1.reduce_rarity_by send2.pronunciation
      send2.reduce_rarity_by send1.pronunciation
      return 'both'
    end
  end

  def self.store_result(player_champ, ai_champ, result, survivors)
    case result
    when 'player'
      survivors['player'].push player_champ
      survivors['ai'].delete ai_champ
    when 'ai'
      survivors['ai'].push ai_champ
      survivors['player'].delete player_champ
    when 'both'
      survivors['player'].push player_champ
      survivors['ai'].push ai_champ
    when 'none'
      survivors['player'].delete player_champ
      survivors['ai'].delete ai_champ
    end
  end

  def self.remove_the_dead_(hashmap)
    #TODO must be possible to make this one hashmap.lists thing
    if hashmap['player'].respond_to?('each')
      hashmap['player'].each do |value|
        if value.respond_to?('rarity')
          if value.rarity <= 0
            hashmap['player'].delete(value)
          end
        end
      end
    end
    if hashmap['ai'].respond_to?('each')
      hashmap['ai'].each do |value|
        if value.respond_to?('rarity')
          if value.rarity <= 0
            hashmap['ai'].delete(value)
          end
        end
      end
    end
  end

  def Arena.handle_sends(player_send, ai_send, last_survivors)
    remove_the_dead_(last_survivors)
    next_survivors = last_survivors

    #the first sent still surviving on both sides
    player_champ = player_send
    ai_champ = ai_send

    # if there are survivors on both sides
    if IF.both_side_survived? last_survivors
      player_champ = last_survivors['player'][0]
      ai_champ = last_survivors['ai'][0]
      next_survivors['player'].push player_send
      next_survivors['ai'].push ai_send
      # if only player survived last
    elsif last_survivors['player'][0] != nil #then it's ai_send's that's 'champ'
      player_champ = last_survivors['player'][0]
      next_survivors['player'].push player_send
      # if only ai survived last
    elsif  last_survivors['ai'][0] != nil #then it's player_send's that's 'champ'
      ai_champ = last_survivors['ai'][0]
      next_survivors['ai'].push ai_send
    end

    puts "\t THE FIGHTERS: player: #{player_champ.info}, ai: #{ai_champ.info}"
    result = Arena.handle_fight(player_champ, ai_champ)
    store_result(player_champ, ai_champ, result, next_survivors)

    #TODO check survivors for anyone losing a life
    return next_survivors
  end

end
#script for running the game
require_relative('runnertext')
require_relative('ai')
require_relative('player')
require_relative('IF')

def run_setup(player,ai)
  #Says hello, and gets the name the player wants
  RunnerText.greeting()
  player.set('name', $stdin.gets.chomp.capitalize)

  #info about the situation
  RunnerText.declaration_of_love(player.get('name'),ai.get('name'),ai.get('language'))

  #asks the player for the language they want
  RunnerText.ask_for_language(player.get('name'))
  lang = $stdin.gets.chomp
  langs = "EeNnMm"
  if langs.include?(lang)
    player.set('language',lang)
  else
    puts "make it binary then!"
    player.set('language','b')
  end

  #asks the player for the standard upgrade they want
  RunnerText.ask_about_upgrade(player.get('language'),ai.get('name'))
  upgrade_input = $stdin.gets.chomp
  if upgrade_input.include?('b')
    player.add('bold')
  elsif upgrade_input.include?('i')
    player.add('italic')
  elsif upgrade_input.include?('u')
    player.add('underlined')
  end

  #sets it up for GO TIME
  RunnerText.ready(player.get('name'),player.get('upgrade'),ai.get('name'),ai.get('upgrade'))
end

def make_player_opt(language)
  player_opt = []
  language.vowels.each do |vowel|
    player_opt.push(vowel.name)
  end
  language.consonants.each do |consonant|
    player_opt.push(consonant.name)
  end
  language.words.each do |word|
    player_opt.push(word.spelling)
  end
  return player_opt
end

def educate(player)
  player.level_up #not quite so simple
end

def dish_out_vocals(player,ai)
  player.broaden_vocabulary
  ai.broaden_vocabulary
end

def handle_fight(send1,send2)
  if IF.can_kill_and_survive?(send1,send2)
    puts "PLAYER WIN"
    send1.reduce_rarity_by(send2.pronunciation)
    return 'player'
  elsif IF.will_mutually_destruct?(send1,send2)
    puts "DEATH TIE!"
    return 'none'
  elsif  IF.can_kill_and_survive?(send2,send1)
    puts "AI WIN!"
    send2.reduce_rarity_by(send1.pronunciation)
    return 'ai'
  elsif !IF.will_mutually_destruct?(send1,send2) # nobody can kill anything
    puts "LIFE TIE!"
    send1.reduce_rarity_by(send2.pronunciation)
    send2.reduce_rarity_by(send1.pronunciation)
    return 'both'
  end
end

def handle_sends(player_send,ai_send,last_survivors)
  next_survivors = {
    'player' => [],
    'ai' => []
  }

  #the survivors go again
  #the sends first has to battle the survivors

  puts "send stats:"
  puts "\tAI     : atk:#{ai_send.pronunciation}, Hp:#{ai_send.rarity}"
  puts "\tPlayer : atk:#{player_send.pronunciation}, Hp:#{player_send.rarity}"
  result = handle_fight(player_send,ai_send)
  case result
  when 'player'
    next_survivors['player'].push(player_send)
  when 'ai'
    next_survivors['ai'].push(ai_send)
  when 'both'
    next_survivors['player'].push(player_send)
    next_survivors['ai'].push(ai_send)
  when 'none'
  end

  #TODO check survivors for anyone losing a life
  return next_survivors
end

def get_send_from_arg(language,arg)
  language.vowels.each do |vowel|
    if vowel.name == arg
      return Vowel.new(vowel.name,vowel.index)
    end
  end
  language.consonant do |cons|
    if cons.name == arg
      return Consonant.new(cons.name,cons.index)
    end
  end
  language.words.each do |word|
    if word.spelling == arg
      return Word.new(word.spelling,word.vowels,word.consonants,word.index)
    end
  end
  puts "WTF!? SHOULD'VE BEEN A SENDING OPT!"
end

def make_send(choice)
  if choice.is_a?(Vowel)
    return Vowel.new(choice.name,choice.index)
  elsif choice.is_a?(Consonant)
    return Consonant.new(choice.name,choice.index)
  elsif choice.is_a?(Word)
    return Word.new(choice.spelling,choice.vowels,choice.consonants,choice.index)
  end
end

def run_game(player,ai)
  empty_char = Character.new("no",1,0,0,0)
  survivors = {
    'player' => [empty_char],
    'ai' => [empty_char]
  }
  prompt = ')> '
  puts "running game"
  round = 1
  ai_send_choice =  ai.calc_next_move(empty_char,round)
  ai_send = make_send(ai_send_choice)
  arg_result = ""
  player_won = false
  player_opt = make_player_opt(player.get('language'))
  player_send = 0

  #THE CORE LOOP!
  while player.get('ego') != round && ai.get('ego') != round
    puts "\t\t the player survivors: #{survivors['player']}"
    puts "\t\t the ai     survivors: #{survivors['ai']}"
    puts "ai decided that '#{ai_send.name}' would do"
    print "counter argument?", prompt
    arg = $stdin.gets.chomp
    if IF.is_a_sending_opt?(player_opt,arg) #TODO FUTURE make several sends possible
      player_send = get_send_from_arg(player.get('language'),arg)
      arg_result = "You're sending #{arg}!"
    elsif IF.is_info_arg?(arg)
      RunnerText.send_opt_info(player.get('language'),arg)
      next
    else
      case arg
      when ""
        player_send = empty_char
        arg_result = "come on... tryyy"
      when "no"
        player_send = empty_char
        arg_result = "ok.."
      when "-h"
        RunnerText.print_player_info(player)
        next
      when '-s'
        RunnerText.argument_queue(survivors)
        next
      when "-read"
        arg_result = "\*learning shit\*\n\t..updating player opts.."
        educate(player)
      when "quit"
        RunnerText.say_goodbye('quit')
      else
        #shouldn't ever actually get here
        puts "no cheating!"
        next
      end
    end
    puts arg_result
    survivors = handle_sends(player_send,ai_send,survivors)

    if false #arg_result -> ai_ego = 0
      player_won = true
      break
    elsif false #arg_result -> player_ego = 0
      break
    else #new round
      round += 1
      puts "count : #{round}"
      arg_result = ""
      dish_out_vocals(player,ai)
      ai_send = make_send(ai.calc_next_move(player_send,round))
      player_send = 0
    end
  end

  #GAME OVER

  #if won
  #puts "YEY!!! WE KNEW IT! OF COURSE YOU CONVINCED THE OPPOSER!"
  #RunnerText.won

  #if lost
  RunnerText.lost

  #all done, wrap it up
  RunnerText.say_goodbye('done')
end

def run()
  #init player values
  player_ego = 7
  player_vocabulary = 9
  player = Player.new(1,player_ego,player_vocabulary,1)

  #init ai values
  ai_name = "Laidee Wlongry-Chpelt"
  ai_ego = 10
  ai_vocabulary = 5
  ai_language = AI.rand_lang()
  ai = AI.new(ai_name,ai_ego,ai_vocabulary,ai_language)
  AI.rand_upgrade(ai)

  #run_setup(player,ai)

  run_game(player,ai)
end

run
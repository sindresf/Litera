#script for running the game
require_relative('runnertext')
require_relative('ai')
require_relative('player')

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

def is_a_sending_opt?(opts,arg)
  if arg == ""
    puts "returns false on empty"
    return false
  end
  opts.each do |opt|
    if opt.include?(arg)
      return true
    end
  end
  return false
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

def handle_sends(player_send,ai_send,last_survivors)
  next_survivors = [[],[]] #TODO MAKE HASH FOR PLAYER / AI
  puts "send stats:"
  puts "\tPLAYER ATTACK: atk:#{player_send.pronunciation}, aiHp:#{ai_send.rarity}"
  puts "\tPLAYER LIFE: pHp:#{player_send.rarity}, aiAtk:#{ai_send.pronunciation}"
  if player_send.pronunciation >= ai_send.rarity && player_send.rarity > ai_send.pronunciation #player kills ai and survives
    puts "PLAYER WIN"
    next_survivors.push(player_send)
  elsif player_send.pronunciation >= ai_send.rarity && player_send.rarity <= ai_send.pronunciation #both die
    puts "DEATH TIE!"
  elsif player_send.pronunciation < ai_send.rarity && player_send.rarity <= ai_send.pronunciation #player can't kill ai, and dies
    puts "AI WIN!"
    next_survivors.push(ai_send)
  else # both survive
    puts "LIFE TIE!"
    next_survivors.push(player_send,ai_send)
  end
end

def is_info_arg(arg)
  info_args = "-v-c-w"
  return info_args.include?(arg)
end

def get_send_from_arg(language,arg)
  language.vowels.each do |vowel|
    if vowel.name == arg
      return vowel
    end
  end
  language.consonant do |cons|
    if cons.name == arg
      return cons
    end
  end
  language.words.each do |word|
    if word.spelling == arg
      return word
    end
  end
  puts "WTF!? SHOULD'VE BEEN A SENDING OPT!"
end

def run_game(player,ai)
  survivors = [[],[]] #TODO make the hashtable
  prompt = ')> '
  puts "running game"
  round = 1
  ai_send =  ai.calc_next_move(" ",round)
  arg_result = ""
  player_won = false
  player_opt = make_player_opt(player.get('language'))
  player_send = 0

  #THE CORE LOOP!
  while player.get('ego') != round && ai.get('ego') != round
    puts "ai decided that '#{ai_send.name}' would do"
    print "counter argument?", prompt
    arg = $stdin.gets.chomp
    if is_a_sending_opt?(player_opt,arg) #TODO FUTURE make several sends possible
      player_send = get_send_from_arg(player.get('language'),arg)
      arg_result = "You're sending #{arg}!"
    elsif is_info_arg(arg)
      RunnerText.send_opt_info(player.get('language'),arg)
      next
    else
      case arg
      when "no"
        player_send = " "
        arg_result = "ok.."
      when "-h"
        RunnerText.print_player_info(player)
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
      ai_send = ai.calc_next_move(player_send,round)
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

def rand_lang(random)
  ai_lang_nr = random.rand(3)
  case ai_lang_nr
  when 0
    return 'E'
  when 1
    return 'N'
  when 2
    return 'M'

  end
end

def rand_upgrade(ai,random)
  ai_upgrade_nr = random.rand(3)
  case ai_upgrade_nr
  when 0
    ai.add("bold")
  when 1
    ai.add("italic")
  when 2
    ai.add("underlined")
  end
end

def run()
  player_ego = 7
  player_vocabulary = 9
  player = Player.new(1,player_ego,player_vocabulary,1)
  ai_name = "Laidee Wlongry-Chpelt"
  ai_ego = 10
  ai_vocabulary = 5
  ai_language = "E" #choose at random
  ai_rand = Random.new
  ai_language = rand_lang(ai_rand)
  ai = AI.new(ai_name,ai_ego,ai_vocabulary,ai_language)
  rand_upgrade(ai,ai_rand)

  #run_setup(player,ai)

  run_game(player,ai)
end

run
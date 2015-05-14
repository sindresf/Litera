#script for running the game
require_relative('runnertext')
require_relative('ai')
require_relative('player')
require_relative('if')
require_relative('arena')

def run_setup(player,ai)
  #Says hello, and gets the name the player wants
  RunnerText.greeting
  player.set('name', $stdin.gets.chomp.capitalize)

  #info about the situation
  RunnerText.declaration_of_love(player.name, ai.name, ai.language)

  #asks the player for the language they want
  RunnerText.ask_for_language player.name
  lang = $stdin.gets.chomp
  langs = "EeNnMm"
  if langs.include? lang
    player.set('language',lang)
  else
    puts "make it binary then!"
    player.set('language','b')
  end

  #asks the player for the standard upgrade they want
  RunnerText.ask_about_upgrade(player.language, ai.name)
  upgrade_input = $stdin.gets.chomp
  if upgrade_input.include?('b')
    player.add('bold')
  elsif upgrade_input.include?('i')
    player.add('italic')
  elsif upgrade_input.include?('u')
    player.add('underlined')
  end

  #sets it up for GO TIME
  RunnerText.ready(player.name, player.upgrade, ai.name, ai.upgrade)
end

def make_player_opt(language)
  player_opt = []
  language.vowels.each do |vowel|
    player_opt.push vowel.name
  end
  language.consonants.each do |consonant|
    player_opt.push consonant.name
  end
  language.words.each do |word|
    player_opt.push word.spelling
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

def get_send_from_arg(language,arg)
  language.vowels.each do |vowel|
    if vowel.name == arg
      return Vowel.new(vowel.name, vowel.index)
    end
  end
  language.consonant do |cons|
    if cons.name == arg
      return Consonant.new(cons.name, cons.index)
    end
  end
  language.words.each do |word|
    if word.spelling == arg
      return Word.new(word.spelling, word.vowels, word.consonants, word.index)
    end
  end
  puts "WTF!? SHOULD'VE BEEN A SENDING OPT!"
end

def make_send(choice)
  if choice.is_a? Vowel
    return Vowel.new(choice.name, choice.index)
  elsif choice.is_a? Consonant
    return Consonant.new(choice.name, choice.index)
  elsif choice.is_a? Word
    return Word.new(choice.spelling, choice.vowels, choice.consonants, choice.index)
  end
end

def run_game(player,ai)
  empty_char = Character.new("no",1,0,0,0)
  survivors = {
    'player' => [],
    'ai' => []
  }
  prompt = ')> '
  puts "running game"
  round = 1
  puts "ai voc: #{ai.vocabulary}"
  ai_send_choice =  ai.calc_next_move(empty_char, round)
  ai_send = make_send ai_send_choice
  arg_result = ""
  player_won = false
  player_opt = make_player_opt player.language
  player_send = 0

  #THE CORE LOOP!
  while player.ego != round && ai.ego != round #TODO make this count life ofc, when fighting works
    puts "ai  voc: #{ai.vocabulary}"
    puts "pl  voc: #{player.vocabulary}"
    puts "\t\t the player survivors: #{RunnerText.hash_print_values(survivors['player'])}"
    puts "\t\t the ai     survivors: #{RunnerText.hash_print_values(survivors['ai'])}"
    puts "ai decided that '#{ai_send.name}' would do"
    print "counter argument?", prompt
    arg = $stdin.gets.chomp
    if IF.is_a_sending_opt?(player_opt, arg) #TODO FUTURE make several sends possible
      player_send = get_send_from_arg(player.language, arg)
    elsif IF.is_info_arg? arg
      RunnerText.send_opt_info(player.language, arg)
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
        RunnerText.print_player_info player
        next
      when '-s'
        RunnerText.argument_queue survivors
        next
      when "-read"
        arg_result = "\*learning shit\*\n\t..updating player opts.."
        educate player
      when "quit"
        RunnerText.say_goodbye('quit')
      else
        #shouldn't ever actually get here
        puts "no cheating!"
        next
      end
    end
    if IF.can_afford?(player_send, player.vocabulary)
      player.pay_for player_send
      arg_result = "You're sending #{arg}!"
    else
      puts "no debt allowed here! choose something you can afford!"
      next
    end
    puts arg_result
    survivors = Arena.handle_sends(player_send, ai_send,survivors)

    if false #arg_result -> ai_ego = 0
      player_won = true
      break
    elsif false #arg_result -> player_ego = 0
      break
    else #new round
      round += 1
      puts "count : #{round}"
      arg_result = ""
      dish_out_vocals(player, ai)
      ai_send = make_send(ai.calc_next_move(player_send, round))
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
  player_vocabulary = 5
  player = Player.new(1, player_ego, player_vocabulary, 1)

  #init ai values
  ai_name = "Laidee Wlongry-Chpelt"
  ai_ego = 10
  ai_vocabulary = 25
  ai_language = AI.rand_lang
  ai = AI.new(ai_name, ai_ego, ai_vocabulary, ai_language)
  AI.rand_upgrade ai

  #run_setup(player,ai)

  run_game(player, ai)
end

run
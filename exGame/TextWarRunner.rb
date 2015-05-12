#script for running the game
require_relative('RunnerText')
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
  player.set('language',$stdin.gets.chomp)

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

def print_player_info(player)
  puts "#{player.get('name')}, you have these options:"
  puts "\tyour ego: #{player.get('ego')}."
  puts "\tyour vocabulary: #{player.get('vocabulary')}."
  puts " "
  puts "\tyou can argue in #{player.get('language').name}, with"
  vowels = []
  player.get('language').vowels.each do |vowel|
    vowels.push(vowel.name)
  end
  puts "\t\t vowels: #{vowels},"
  consonants = []
  player.get('language').consonants.each do |consonant|
    consonants.push(consonant.name)
  end
  puts "\t\t consonants: #{consonants},"
  words = []
  player.get('language').words.each do |word|
    words.push(word.spelling)
  end
  puts "\t\t words: #{words},"
  puts ""
  puts "\t\t~arg.\t~\#arg1,arg2..."
  puts ""
  puts "\tor take a hit to your ego in silence. ~no"
  puts ""
  puts "\tor read the dictionary. ~-read"
  puts "\t\t this will give you \*+2\* vocabulary, and a new \*vowel/cons/word\*"

  puts "\n..you can always also quit, any time :)\n\n"
end

def is_a_player_opt(opts,arg)
  puts "the opts: #{opts}"
  opts.each do |opt|
    print "  #{opt}"
    if opt.include?(arg)
      puts "UTTVOAUSVDAVOEGVKAJVFKUEVFUVuyv"
      return true #FINDS IT, DOES NOT RETURN AND REGISTER PROPERLY!!! ???
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

def run_game(player,ai)
  prompt = ')> '
  puts "running game"
  vowel =  ai.calc_next_move(" ")
  puts "ai decided that '#{vowel}' would do"
  ego_dead = 0
  arg_result = ""
  player_won = false
  player_opt = make_player_opt(player.get('language'))
  #THE CORE LOOP!
  while player.get('ego') != ego_dead && ai.get('ego') != ego_dead
    print "counter argument?", prompt
    arg = $stdin.gets.chomp
    puts "the arg: #{arg}"
    case arg
    when is_a_player_opt(player_opt,arg)      #TODO these two!
      puts "IT WAS ACTUALLY A THING"
      arg_result = "You're sending #{arg}!"
    when "no"
      arg_result = "ok.."
    when "-h"
      print_player_info(player)
      next
    when "-read"
      arg_result = "\*learning shit\*\n\t..updating player opts.."
    when "quit"
      puts "LOL, quitter!"
      exit(0)
    when !is_a_player_opt(player_opt,arg)      #TODO these two!
      arg_result = "what was that??"
      puts "CAUGHT A THING!!"
    else
      puts "no cheating!"
      next
    end
    puts arg_result
    if false #arg_result -> ai_ego = 0
      player_won = true
      return
    elsif false #arg_result -> player_ego = 0
      return
    else #new round
      puts "\*ai thinking\*"
      ego_dead += 1
      puts "count : #{ego_dead}"
      arg_result = ""
    end
  end

  #GAME OVER

  #if won
  #puts "YEY!!! WE KNEW IT! OF COURSE YOU CONVINCED THE OPPOSER!"

  #if lost
  sleep(1)
  puts "oh, that's too bad...we always believed in you...!"
  sleep(3)

  #both
  puts " "
  puts "KthxBye"
  sleep(2)
  puts "\n" * 30
  exit(0)
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

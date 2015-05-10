#script for running the game
require_relative('introtext')
require_relative('ai')
require_relative('player')

def run_setup(player,ai)
  #Says hello, and gets the name the player wants
  IntroText.greeting()
  player.set('name', $stdin.gets.chomp.capitalize)

  #info about the situation
  IntroText.declaration_of_love(player.get('name'),ai.get('name'),ai.get('language'))

  #asks the player for the language they want
  IntroText.ask_for_language(player.get('name'))
  player.set('language',$stdin.gets.chomp)

  #asks the player for the standard upgrade they want
  IntroText.ask_about_upgrade(player.get('language'),ai.get('name'))
  upgrade_input = $stdin.gets.chomp
  if upgrade_input.include?('b')
    player.add('bold')
  elsif upgrade_input.include?('i')
    player.add('italic')
  elsif upgrade_input.include?('u')
    player.add('underlined')
  end

  #sets it up for GO TIME
  IntroText.ready(player.get('name'),player.get('upgrade'),ai.get('name'),ai.get('upgrade'))

end

def print_player_info(player)
  puts "#{player.get('name')}, you have these options:"
  puts "\tyour ego: #{player.get('ego')}."
  puts "\tyour vocabulary: #{player.get('vocabulary')}."
  puts " "
  puts "\tyou can argue in #{player.get('language').name}, with"
  puts "\t\t vowels,"
  puts "\t\t consonants,"
  puts "\t\t words,"
  puts "\t\t-arg.\t-\#arg1,arg2..."
  puts ""
  puts "\tor take a hit to your ego in silence. -no"
  puts ""
  puts "\tor read the dictionary. --read"
  puts "\t\t this will give you \*+2\* vocabulary, and a new \*vowel/cons/word\*"

  puts "\n..you can always also quit, any time :)\n\n"
end

def run_game(player,ai)
  prompt = ')> '
  puts "running game"
  vowel =  ai.calc_next_move(" ")
  puts "ai decided that '#{vowel}' would do"
  ego_dead = 0
  while player.get('ego') != ego_dead || ai.get('ego') != ego_dead
    print "counter argument?", prompt
    arg = $stdin.gets.chomp
    case
    when arg == "no"
      puts "ok.."
    when arg == "-h"
      print_player_info(player)
      next
    when arg == "quit"
      puts "LOL, quitter!"
      exit(0)
    end
    puts "\*argument result\*"
    puts "\*ai thinking\*"
    ego_dead += 1
  end
  puts "oh, that's too bad...and I was soo in the mode for more brilliance!"
  puts "KthxBye"
  exit(0)
end

def run()
  player_ego = 7
  player_vocabulary = 9
  player = Player.new(1,player_ego,player_vocabulary,1)
  ai_name = "Laidee Wlongry-Chpelt"
  ai_ego = 10
  ai_vocabulary = 5
  ai_language = "E" #choose at random
  ai = AI.new(ai_name,ai_ego,ai_vocabulary,ai_language)
  ai.add("italic") #choose at random

  #run_setup(player,ai)

  run_game(player,ai)
end

run

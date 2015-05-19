module RunnerText
  def self.clear_screen()
    (0..50).each do |i|
      puts " "
    end
  end

  def self.print_dots()
    (0..2).each do |dot|
      print '.'
      sleep 0.4
    end
    puts ""
    sleep 0.7
    (0..2).each do |dot|
      print '.'
      sleep 0.4
    end
    puts ""
  end

  def self.quick_print_line(line, wait = 0.032, new_line_wait = 0.7)
    if wait == nil
      wait = 0.032
    end
    line.each_byte do |char|
      sleep wait
      print char.chr
    end
    sleep new_line_wait
    puts ""
  end

  def RunnerText.greeting()
    clear_screen
    prompt = ')> '
    quick_print_line( "Ahoy hoy!")
    quick_print_line( "Oh Knower of Words, how are you!? :D")
    quick_print_line("or what is it you might prefer these days?#{prompt}")
  end

  def RunnerText.declaration_of_love(player_name, ai_name, random_language)
    sleep 0.2
    clear_screen
    prompt = ')> '
    puts " "
    sleep 0.5
    quick_print_line("Oh really? #{player_name}, is it now? I feel like our bond has grown closer since last <3", nil, 1.2)
    quick_print_line("But, Never mind! That for another day ;)", nil, 1.2)
    quick_print_line("\nI come with grave news!", nil, 1.2)
    quick_print_line("\nThe evil Miss Communicator, #{ai_name},")
    quick_print_line("is speaking up against our Holy Grammar!", nil, 1)
    quick_print_line("Her #{random_language.name} is fluent,")
    quick_print_line("but we know you can best her with your vast vocabulary")
    quick_print_line("and awesome word flow!#{prompt}")
    nuffin = $stdin.gets
    sleep 0.7
  end

  def RunnerText.ask_for_language(player_name)
    clear_screen
    prompt = ')> '
    quick_print_line("If #{player_name} would tell the good people of Dicshionerry")
    quick_print_line("what language you will,", nil, 0.03)
    quick_print_line("be arguing in,", nil, 0.03)
    quick_print_line("so they could all follow along,", nil, 0.03)
    quick_print_line("that would be great!")
    puts" "
    quick_print_line("Yes", 0.08, 1)
    quick_print_line("lovely:", 0.08)
    puts " "
    language1, language2, language3 = ["English", "Norwegian", "Maori"]
    quick_print_line("#{language1}", 0.01, 0.2)
    quick_print_line("#{language2}", 0.01, 0.2)
    quick_print_line("#{language3}", 0.01, 0.2)
    print prompt
  end

  def RunnerText.ask_about_upgrade(player_language, ai_name)
    clear_screen
    prompt = ')> '
    quick_print_line("Quite. Indeed!")
    quick_print_line("#{player_language.name} will not only do, it will do more than nicely!", nil, 1.5)
    quick_print_line("It Shall Devastate!", nil, 1.2)
    quick_print_line("IT WILL DECIMATE! AND LEAVE #{ai_name} IN RUIN!!", 0.08, 3)
    quick_print_line("EXTERMINATE!", 0.01, 1.5)
    quick_print_line("EXTEERMIINAAATE!!", 0.1, 1.5)
    print_dots
    sleep 0.3
    quick_print_line("The people are excited about your help, oh Cool and Groovy One", 0.037)
    sleep 1.5
    print '.'
    sleep 0.2
    print '.'
    sleep 0.3
    puts "is all."
    sleep 1.5
    puts " "
    quick_print_line("Back to preparations:", nil, 1.2)
    quick_print_line("would you prefer your words documented for history in")
    quick_print_line("\n\tbold,")
    quick_print_line("\titalic,")
    quick_print_line("\tunderlined?#{prompt}")
  end

  def self.print_logo()
    puts " "
    puts " "
    sleep 0.3
    quick_print_line("\t\t\t______________________________________", 0.03, 0.02)
    quick_print_line("\t\t\t| \t\t\t\t     |", 0.0175)
    quick_print_line("\t\t\t| \t_____________________\t     |", 0.01, 0.015)
    quick_print_line("\t\t\t| \t\\/   LITERAL WAR   \\/\t     |", 0.01, 0.01)
    quick_print_line("\t\t\t|\t*********************\t     |", 0.007, 0.01)
    quick_print_line("\t\t\t|\t  - this means war  \t     |", 0.005, 0)
    quick_print_line("\t\t\t| \t\t\t\t     |",0.003,0)
    quick_print_line("\t\t\t|____________________________________|", 0.002, 0)
    puts " "
  end

  def RunnerText.ready(player_name, player_upgrade, ai_name, random_upgrade)
    sleep 1
    clear_screen
    sleep 1
    quick_print_line('Nothing less than what we have come to expect from The Idol,')
    quick_print_line("The Thesaurus, my #{player_name}. ;) ^^")
    quick_print_line("#{player_upgrade} should work well against #{ai_name} chosen upgrade, #{random_upgrade}.", nil, 1.8)
    puts " "
    quick_print_line('Hopefully.', 0.08, 0.7)
    quick_print_line('No doubting our Crossword Creator of course! Oh no, would never.', nil, 2)
    quick_print_line( 'do not be mad', 0.12, 3)
    clear_screen
    puts 'I think we’re all set for debate! OR AS THIS SHALL GO DOWN IN THE BOOKS FOR THE LEGENDS:'
    sleep 2
    print_logo
    sleep 1
    puts " "
    sleep 1
    puts " "
    sleep 1.2
    puts " "
    sleep 1.3
    puts " "
    sleep 1.7
    puts " "
    sleep 2.5
    clear_screen
    sleep 1.5
    puts 'BEGIN'
    puts " "
  end
end

def RunnerText.print_player_info(player)
  char_wait = 0.005
  line_wait = 0.01
  quick_print_line("#{player.name}, you have these options:", char_wait, line_wait)
  quick_print_line( "\tyour ego: #{player.ego}.", char_wait, line_wait)
  quick_print_line( "\tyour vocabulary: #{player.vocabulary}.\n", char_wait, line_wait)
  quick_print_line( "\tyou can argue in #{player.language.name}, with", char_wait, line_wait)
  vowels = []
  player.language.vowels.each do |vowel|
    vowels.push vowel.name
  end
  quick_print_line("\t\t vowels: #{vowels},", char_wait, line_wait)
  consonants = []
  player.language.consonants.each do |consonant|
    consonants.push consonant.name
  end
  quick_print_line("\t\t consonants: #{consonants},", char_wait, line_wait)
  words = []
  player.language.words.each do |word|
    words.push word.spelling
  end
  quick_print_line("\t\t words: #{words},", char_wait, line_wait)
  quick_print_line("\twith:     arg.\t\#arg1,arg2...\n", char_wait, line_wait)
  quick_print_line("\tget info about vowels/consonants/words, -v, -c, w", char_wait, line_wait)
  quick_print_line("\tget info about current argument queue, -s\n", char_wait, line_wait)
  quick_print_line("\tor take a hit to your ego in silence. no\n", char_wait, line_wait)
  quick_print_line("\tor read the dictionary. -read", char_wait, line_wait)
  quick_print_line("\t\t this will give you \*+2\* vocabulary, and a new \*vowel/cons/word\*", char_wait, line_wait)
  quick_print_line("\n..you can always also quit, any time :)\n\n", char_wait, line_wait)
end

def RunnerText.send_opt_info(language, type)

  #type = vowel,consonant,word
  case type
  when '-v'
    quick_print_line("\tvowel stats:", 0.01)
    language.vowels.each do |vowel|
      quick_print_line("\t\t#{vowel.name}:   r.#{vowel.rarity}, p.#{vowel.pronunciation}, c.#{vowel.memory_cost}", 0.01, 0.1)
    end
  when '-c'
    quick_print_line("\tconsonant stats:", 0.01)
    language.consonants.each do |consonant|
      quick_print_line("\t\t#{consonant.name}:   r.#{consonant.rarity}, p.#{consonant.pronunciation}, c.#{consonant.memory_cost}", 0.01, 0.1)
    end
  when '-w'
    quick_print_line("\tword stats", 0.01)
    language.words.each do |word|
      quick_print_line("\t\t#{word.spelling}:   r.#{word.rarity}, p.#{word.pronunciation}, c.#{word.memory_cost}", 0.01, 0.1)
    end
  end
end

def RunnerText.argument_queue(survivors)
  puts "\t your surviving arguments:"
  print "\t    "
  survivors['player'].each do |argument|
    print "#{argument.name}, Hp:#{argument.rarity}, atk:#{argument.pronunciation}  |  "
  end
  puts ""
  puts "\t ai surviving arguments:"
  print "\t    "
  survivors['ai'].each do |argument|
    print "#{argument.name}, Hp:#{argument.rarity}, atk:#{argument.pronunciation}  |  "
  end
  puts ""
end

def RunnerText.lost()
  sleep 1
  quick_print_line("oh, that's too bad...we always believed in you...!", 0.001, 0)
  sleep 3
end

def RunnerText.won()
  sleep 1
  quick_print_line("oh,NICE!! I knew it! never doubted you for a sec! Not a sec!", 0.002, 0)
  sleep 3
end

def RunnerText.say_goodbye(why)
  if why == 'done'
    puts " "
    puts "KthxBye"
  elsif why == 'quit'
    puts "LOL, quitter!"
    sleep 0.55
    puts "\n\nbbye then!"
  end
  sleep 1.5
  clear_screen
  exit 0
end

def RunnerText.hash_print_values(value_list)
  print_string = ""
  if value_list.respond_to?('each')
    value_list.each do |value|
      print_string += value.info + "  "
    end
  else
    print_string += "none"
  end
  return print_string
end
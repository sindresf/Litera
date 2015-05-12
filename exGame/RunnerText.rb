module RunnerText
  def self.clear_screen()
    (0..50).each do |i|
      puts " "
    end
  end

  def self.print_dots()
    print '.'
    sleep(0.4)
    print '.'
    sleep(0.4)
    print '.'
    sleep(1)
    puts ""
    print '.'
    sleep(0.4)
    print '.'
    sleep(0.4)
    puts '.'
    sleep(1.5)
    print '.'
    sleep(0.6)
    print '.'
  end

  def self.quick_print_line(line,wait = 0.032,new_line_wait = 0.7)
    if wait == nil
      wait = 0.032
    end
    line.each_byte do |char|
      sleep(wait)
      print char.chr
    end
    sleep(new_line_wait)
    puts ""
  end

  def RunnerText.greeting()
    clear_screen
    prompt = ')> '
    quick_print_line( "Ahoy hoy!")
    quick_print_line( "Oh Knower of Words, how are you!? :D")
    quick_print_line("or what is it you might prefer these days?#{prompt}")
  end

  def RunnerText.declaration_of_love(player_name,ai_name,random_language)
    sleep(0.2)
    clear_screen
    prompt = ')> '
    puts " "
    sleep(0.5)
    quick_print_line("Oh really? #{player_name}, is it now? I feel like our bond has grown closer since last <3",nil,1.2)
    quick_print_line("But, Never mind! That for another day ;)",nil,1.2)
    quick_print_line("\nI come with grave news!",nil,1.2)
    quick_print_line("\nThe evil Miss Communicator, #{ai_name},")
    quick_print_line("is speaking up against our Holy Grammar!",nil,1)
    quick_print_line("Her #{random_language.name} is fluent,")
    quick_print_line("but we know you can best her with your vast vocabulary")
    quick_print_line("and awesome word flow!#{prompt}")
    nuffin = $stdin.gets
    sleep(0.7)
  end

  def RunnerText.ask_for_language(player_name)
    clear_screen
    prompt = ')> '
    quick_print_line("If #{player_name} would tell the good people of Dicshionerry")
    quick_print_line("what language you will,",nil,0.03)
    quick_print_line("be arguing in,",nil,0.03)
    quick_print_line("so they could all follow along,",nil,0.03)
    quick_print_line("that would be great!",nil,1.2)
    puts" "
    quick_print_line("Yes",0.08,1.4)
    quick_print_line("lovely:",0.08)
    puts " "
    language1,language2,language3 = ["English", "Norwegian", "Maori"]
    quick_print_line("#{language1}",0.01,0.2)
    quick_print_line("#{language2}",0.01,0.2)
    quick_print_line("#{language3}",0.01,0.2)
    print prompt
  end

  def RunnerText.ask_about_upgrade(player_language,ai_name)
    clear_screen
    prompt = ')> '
    quick_print_line("Quite. Indeed!")
    quick_print_line("#{player_language.name} will not only do, it will do more than nicely!",nil,1.5)
    quick_print_line("It Shall Devastate!",nil,1.2)
    quick_print_line("IT WILL DECIMATE! AND LEAVE #{ai_name} IN RUIN!!",0.08,3)
    quick_print_line("EXTERMINATE!",0.01,1.5)
    quick_print_line("EXTEERMIINAAATE!!",0.1,1.5)
    print_dots
    sleep(0.3)
    quick_print_line("The people are excited about your help, oh Cool and Groovy One",0.037)
    sleep(4)
    print '.'
    sleep(0.2)
    print '.'
    sleep(0.4)
    puts "is all."
    sleep(2)
    puts " "
    quick_print_line("Back to preparations:",nil,1.2)
    quick_print_line("would you prefer your words documented for history in")
    quick_print_line("\n\tbold,")
    quick_print_line("\titalic,")
    quick_print_line("\tunderlined?#{prompt}")
  end

  def self.print_logo()
    puts " "
    puts " "
    sleep(0.3)
    quick_print_line("\t\t\t______________________________________",0.03,0.02)
    quick_print_line("\t\t\t| \t\t\t\t     |",0.0175)
    quick_print_line("\t\t\t| \t_____________________\t     |",0.01,0.015)
    quick_print_line("\t\t\t| \t\\/   LITERAL WAR   \\/\t     |",0.01,0.01)
    quick_print_line("\t\t\t|\t*********************\t     |",0.007,0.01)
    quick_print_line("\t\t\t|\t  - this means war  \t    |",0.005,0)
    quick_print_line("\t\t\t| \t\t\t\t     |",0.003,0)
    quick_print_line("\t\t\t|____________________________________|",0.002,0)
    puts " "
  end

  def RunnerText.ready(player_name, player_upgrade, ai_name, random_upgrade)
    sleep(1)
    clear_screen
    sleep(1)
    quick_print_line('Nothing less than what we have come to expect from The Idol,')
    quick_print_line("The Thesaurus, my #{player_name}. ;) ^^",nil)
    quick_print_line("#{player_upgrade} should work well against #{ai_name} chosen upgrade, #{random_upgrade}.",nil,1.8)
    puts " "
    quick_print_line('Hopefully.',0.08,0.7)
    quick_print_line('No doubting our Crossword Creator of course! Oh no, would never.',nil,2)
    quick_print_line( 'do not be mad',0.12,3)
    clear_screen
    puts 'I think we’re all set for debate! OR AS THIS SHALL GO DOWN IN THE BOOKS FOR THE LEGENDS:'
    sleep(3)
    print_logo
    sleep(1)
    puts " "
    sleep(1)
    puts " "
    sleep(1.2)
    puts " "
    sleep(1.3)
    puts " "
    sleep(1.7)
    puts " "
    sleep(4)
    clear_screen
    sleep(2)
    puts 'BEGIN'
    puts " "
  end
end

def RunnerText.print_player_info(player)
  quick_print_line("#{player.get('name')}, you have these options:",0.005,0.01)
  quick_print_line( "\tyour ego: #{player.get('ego')}.",0.005,0.01)
  quick_print_line( "\tyour vocabulary: #{player.get('vocabulary')}.\n",0.005,0.01)
  quick_print_line( "\tyou can argue in #{player.get('language').name}, with",0.005,0.01)
  vowels = []
  player.get('language').vowels.each do |vowel|
    vowels.push(vowel.name)
  end
  quick_print_line("\t\t vowels: #{vowels},",0.005,0.01)
  consonants = []
  player.get('language').consonants.each do |consonant|
    consonants.push(consonant.name)
  end
  quick_print_line("\t\t consonants: #{consonants},",0.005,0.01)
  words = []
  player.get('language').words.each do |word|
    words.push(word.spelling)
  end
  quick_print_line("\t\t words: #{words},\n",0.005,0.01)
  quick_print_line("\t\t~arg.\t~\#arg1,arg2...\n",0.005,0.01)
  quick_print_line("\tor take a hit to your ego in silence. ~no\n",0.005,0.01)
  quick_print_line("\tor read the dictionary. ~-read",0.005,0.01)
  quick_print_line("\t\t this will give you \*+2\* vocabulary, and a new \*vowel/cons/word\*",0.005,0.01)
  quick_print_line("\n..you can always also quit, any time :)\n\n",0.005,0.01)
end

def RunnerText.say_goodbye(why)
  if why == 'done'
    puts " "
    puts "KthxBye"
  elsif why == 'quit'
    puts "LOL, quitter!"
    sleep(0.55)
    puts "\n\nbbye then!"
  end
  sleep(1.5)
  clear_screen
  exit(0)
end

def class_test()
  puts "testing...RunnerText"
end

#class_test
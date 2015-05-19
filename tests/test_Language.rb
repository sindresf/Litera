require "./lib/Language.rb"
require "test/unit"

class TestLanguage < Test::Unit::TestCase
  def test_Class()
    puts "testing...Language"
    assert_equal('Language', 'Lang'+'ua' + 'ge')
  end

  # TODO FOLLOW THE FORMER PUTS TO MAKE ASSERTS
  def test_english()
    puts "\ttesting...English"
    english = Language.new('E', 'b')
    # puts "english created: #{english}"
    e_name = english.name
    # puts "english is called: #{e_name}"
    e_vowels = english.vowels
    #  puts "english has the vowels: #{e_vowels}"
    # e_vowels.each { |vow| print "#{vow.name}:#{vow.ratio}, "}
    #  puts ""
    e_cons = english.consonants
    #  puts "english has the cons.: #{e_cons}"
    #  e_cons.each { |con| print "#{con.name}:#{con.ratio}, "}
    #  puts ""
    e_words = english.words
    #   puts "english words by (name,ratio):"
    #  e_words.each {|word| puts "\t#{word.spelling},#{word.ratio}"}
  end

  def test_norwegian()
    puts "\ttesting...Norwegian"
    #  puts ""
    norwegian = Language.new('N', 'b')
    #  puts "norwegian created: #{norwegian}"
    n_name = norwegian.name
    #  puts "norwegian is called: #{n_name}"
    n_vowels = norwegian.vowels
    #   puts "norwegian has the vowels: #{n_vowels}"
    #   n_vowels.each { |vow| print "#{vow.name}:#{vow.ratio}, "}
    #   puts ""
    n_cons = norwegian.consonants
    #  puts "norwegian has the cons.: #{n_cons}"
    #   n_cons.each { |con| print "#{con.name}:#{con.ratio}, "}
    #  puts ""
    n_words = norwegian.words
    #   puts "norwegian words by (name,ratio):"
    #  n_words.each {|word| puts "\t#{word.spelling},#{word.ratio}"}
  end

  def test_maori()
    puts "\ttesting...Maori"
    #  puts ""
    maori = Language.new('M', 'b')
    #   puts "maori created: #{maori}"
    m_name = maori.name
    #  puts "maori is called: #{m_name}"
    m_vowels = maori.vowels
    #  puts "maori has the vowels: #{m_vowels}"
    #  m_vowels.each { |vow| print "#{vow.name}:#{vow.ratio}, "}
    #   puts ""
    m_cons = maori.consonants
    #   puts "maori has the cons.: #{m_cons}"
    #  m_cons.each { |con| print "#{con.name}:#{con.ratio}, "}
    #   puts ""
    m_words = maori.words
    #   puts "maori words by (name,ratio):"
    #   m_words.each {|word| puts "\t#{word.spelling},#{word.ratio}"}
  end

  # TODO MAKE THIS LIKE THE OTHERS
  def test_binary()
    puts "\ttesting...binary"
  end

end
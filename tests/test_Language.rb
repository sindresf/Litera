require "./lib/Language.rb"
require "test/unit"

class TestLanguage < Test::Unit::TestCase
  def test_Class()
    puts "testing...Language"
    assert_equal('Language', 'Lang' + 'ua' + 'ge')
  end

  def test_english()
    puts "\ttesting...English"
    english = Language.new('E', 'b')
    e_name = english.name
    assert_equal('English', e_name)
    set_vowel_names = 'aeu'
    e_vowels = english.vowels
    e_vowels.each { |vow| assert_true((set_vowel_names.include? vow.name ))}

    set_con_names = 'tncpq'
    e_cons = english.consonants
    e_cons.each { |con|  assert_true((set_con_names.include? con.name ))}

    set_word_spelling = 'teacunt'
    e_words = english.words
    e_words.each {|word| assert_true((set_word_spelling.include? word.spelling ))}
  end

  def test_norwegian()
    puts "\ttesting...Norwegian"
    norwegian = Language.new('N', 'b')
    n_name = norwegian.name
    assert_equal('Norwegian',n_name)
    set_vowel_names = 'aeuåøæ'
    n_vowels = norwegian.vowels
    n_vowels.each { |vow| assert_true((set_vowel_names.include? vow.name ))}

    set_con_names = 'snkt'
    n_cons = norwegian.consonants
    n_cons.each { |con|  assert_true((set_con_names.include? con.name ))}

    set_word_spelling = 'kåtsnønattå'
    n_words = norwegian.words
    n_words.each {|word| assert_true((set_word_spelling.include? word.spelling ))}
  end

  def test_maori()
    puts "\ttesting...Maori"
    maori = Language.new('M', 'b')
    m_name = maori.name
    assert_equal('Maori',m_name)
    set_vowel_names = 'ao'
    m_vowels = maori.vowels
    m_vowels.each { |vow| assert_true((set_vowel_names.include? vow.name ))}

    set_com_names = 'bldmwz'
    m_cons = maori.consonants
    m_cons.each { |con|  assert_true((set_com_names.include? con.name ))}

    set_word_spelling = 'baomwolazwoaowobloa'
    m_words = maori.words
    m_words.each {|word| assert_true((set_word_spelling.include? word.spelling ))}
  end

  # TODO MAKE THIS LIKE THE OTHERS
  def test_binary()
    puts "\ttesting...Binary"
    binary = Language.new('B','b')
    b_name = binary.name
    assert_equal('Binary',b_name)
    set_vowel_names = 'o'
    b_vowels = binary.vowels
    b_vowels.each { |vow| assert_true((set_vowel_names.include? vow.name ))}

    set_cob_names = 'l'
    b_cons = binary.consonants
    b_cons.each { |con|  assert_true((set_cob_names.include? con.name ))}

    set_word_spelling = 'llllolololoooooolloollo'
    b_words = binary.words
    b_words.each {|word| assert_true((set_word_spelling.include? word.spelling ))}
  end

end
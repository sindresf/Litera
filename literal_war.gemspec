# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "Literal War"
  spec.version       = '1.0.0.1'
  spec.authors       = ["Sindre S. Fjermestad"]
  spec.email         = ["sindresfjermestad@gmail.com"]
  spec.summary       = %q{A 'tug-of-war' game based on linguistic units}
  spec.description   = %q{A bigger attempt at starting to learn ruby for me, this game encompasses testing, classes, inheritance, modules, scripting, handling, loops, ifs, hashmaps, IO. most of the basics and a bit more.}
  spec.homepage      = "http://github.com/sindresf/Literal_War"
  spec.license       = "MIT"

  spec.files         = ['lib/literal_war.rb']
  spec.executables   = ['bin/literal_war']
  spec.test_files    = ['tests/test_literal_war.rb']
  spec.require_paths = ["lib"]
end
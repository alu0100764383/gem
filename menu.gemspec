# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'menu/version'

Gem::Specification.new do |spec|
  spec.name          = "menu"
  spec.version       = Menu::VERSION
  spec.authors       = ["Tomás Rodríguez"]
  spec.email         = ["tomasrodriguez17@gmail.com"]

  spec.summary       = %q{Lista enlazada.}
  spec.homepage      = "TODO: Put your gem's website or public repo URL here."

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 2.11"
  
end

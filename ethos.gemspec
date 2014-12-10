# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ethos/version'

Gem::Specification.new do |spec|
  spec.name          = 'ethos'
  spec.version       = Ethos::VERSION
  spec.authors       = ['Erol Fornoles']
  spec.email         = ['erol.fornoles@gmail.com']
  spec.summary       = %q{Entity Library}
  spec.description   = %q{Entity Library}
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency 'bundler', '~> 1.5'
  spec.add_development_dependency 'rake'

  spec.add_development_dependency 'rspec', '~> 3.0'
end

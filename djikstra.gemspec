# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'djikstra/version'

Gem::Specification.new do |spec|
  spec.name          = 'djikstra'
  spec.version       = Djikstra::VERSION
  spec.authors       = ['Jeff Waltzer']
  spec.email         = ['jeffwaltzer@gmail.com']
  spec.summary       = %q{An implementation of djikstra shortest path algorithm.}
  spec.description   = %q{See http://en.wikipedia.org/wiki/Dijkstra's_algorithm}
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'

  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'pry-remote'
  spec.add_development_dependency 'pry-stack_explorer'
  spec.add_development_dependency 'pry-debugger'

  spec.executables   = ["djikstra"]
end

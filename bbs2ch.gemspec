# -*- encoding: utf-8 -*-
require File.expand_path('../lib/bbs2ch/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["fukayatsu"]
  gem.email         = ["fukayatsu@gmail.com"]
  gem.description   = %q{A gem to read 2ch BBS}
  gem.summary       = %q{A gem to read 2ch BBS}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "bbs2ch"
  gem.require_paths = ["lib"]
  gem.version       = BBS2ch::VERSION

  gem.add_dependency "faraday",  '~> 0.8.8'

  gem.add_development_dependency "rspec"
  gem.add_development_dependency "pry"
end

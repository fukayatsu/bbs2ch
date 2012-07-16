# -*- encoding: utf-8 -*-
require File.expand_path('../lib/bbs2ch/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["fukayatsu"]
  gem.email         = ["fukayatsu@gmail.com"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "bbs2ch"
  gem.require_paths = ["lib"]
  gem.version       = Bbs2ch::VERSION
end

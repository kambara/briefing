# -*- encoding: utf-8 -*-
require File.expand_path('../lib/briefing/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["kambara"]
  gem.email         = ["kambara@sappari.org"]
  gem.description   = %q{Briefing is a presentation tool that lets you create slides from a text file written in Markdown. By executing 'briefing' command and specifying a text file, you can show it as a beautiful slides in your web browser.}
  gem.summary       = %q{A presentation tool that lets you create slides from a text file written in Markdown}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "briefing"
  gem.require_paths = ["lib"]
  gem.version       = Briefing::VERSION
  gem.add_dependency 'sinatra'
  gem.add_dependency 'sinatra-reloader'
end

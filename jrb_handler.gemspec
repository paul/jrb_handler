
# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require "jrb_handler/version"

Gem::Specification.new do |s|
  s.name        = "jrb_handler"
  s.version     = JrbHandler::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Paul Sadauskas"]
  s.email       = ["psadauskas@gmail.com"]
  s.homepage    = "http://github.com/paul/jrb_handler"
  s.summary     = "A Rails template handler and renderer for JSON"
  s.description = <<-DESC
    Jrb Handler makes it easy to write JSON web services in Rails 3. Keep your views in views, not in your Model#to_json.
  DESC

  s.required_rubygems_version = ">= 1.3.6"

  s.add_development_dependency "rspec", ">= 2.0.0"
  s.add_development_dependency "rspec-rails", ">= 2.0.0"
  s.add_development_dependency "bundler"

  s.add_dependency "activesupport", ">= 3.0.3"
  s.add_dependency "actionpack", ">= 3.0.3"

  s.files = `git ls-files`.split("\n")
  s.test_files = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_paths = ['lib']

end

# encoding: utf-8

$:.push("lib")
require 'ducks/version'

Gem::Specification.new do |s|
  s.name        = "ducks"
  s.version     = Ducks::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Alex Young"]
  s.email       = ["alex@blackkettle.org"]
  s.homepage    = "http://github.com/regularfry/ducks"
  s.summary     = "Duck-type checking"
  s.description = "An approximate port of clojure's protocols to allow duck-type checking."

  s.required_rubygems_version = ">= 1.3.6"
  s.rubyforge_project         = "ducks"

  s.add_development_dependency "rspec"

  s.files        = Dir.glob("{bin,lib}/**/*.rb") + %w(LICENSE README.md)
  s.require_path = 'lib'
end

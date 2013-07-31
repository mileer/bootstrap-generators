$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "bootstrap/generators/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "bootstrap-generators"
  s.version     = Bootstrap::Generators::VERSION
  s.authors     = ["Décio Ferreira"]
  s.email       = ["decio.ferreira@decioferreira.com"]
  s.homepage    = "http://decioferreira.github.com/bootstrap-generators/"
  s.summary     = "Bootstrap-generators provides Twitter Bootstrap generators for Rails 4 (supported Rails >= 3.1)."
  s.description = "Bootstrap-generators provides Twitter Bootstrap generators for Rails 4 (supported Rails >= 3.1). Checkout http://twitter.github.com/bootstrap."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib,vendor}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.0.0"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "git"
end

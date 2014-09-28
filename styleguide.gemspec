$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "styleguide/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "styleguide"
  s.version     = Styleguide::VERSION
  s.authors     = ["Kevin Altman", "Jim Remsik"]
  s.email       = ["bot@adorable.io"]
  s.homepage    = "http://adorable.io"
  s.summary     = "TODO: Summary of Styleguide."
  s.description = "TODO: Description of Styleguide."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", "~> 4.1.6"
  s.add_dependency "bourbon"
  s.add_dependency "coffee-rails"
  s.add_dependency "decent_exposure"
  s.add_dependency "haml-rails"
  s.add_dependency "sass-rails"

  s.add_development_dependency 'fivemat'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'factory_girl_rails'
  s.add_development_dependency "sqlite3"
end

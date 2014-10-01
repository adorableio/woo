# desc "Explaining what the task does"
# task :styleguide do
#   # Task goes here
# end

begin
  require 'rspec/core/rake_task'

  desc 'Run all the tests for Woo!'
  RSpec::Core::RakeTask.new(:spec) do |t|
    t.verbose = false
  end

  task :default => :spec
rescue LoadError
  # no rspec available
end

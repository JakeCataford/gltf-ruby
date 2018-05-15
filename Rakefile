require "pry"
require "bundler/gem_tasks"
require "rspec/core/rake_task"

require "gltf"

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

task :console do
  binding.pry
end

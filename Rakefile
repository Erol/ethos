require "bundler/gem_tasks"

desc 'Run gem specs'
task :spec do
  if ENV['CODECLIMATE_REPO_COVERAGE']
    require "codeclimate-test-reporter"

    CodeClimate::TestReporter.start
  end

  require 'microspec'

  runner = Microspec::Runner.new
  runner.includes << 'spec/**/*.rb'
  runner.excludes << 'spec/examples/**/*.rb'

  success = runner.perform

  exit 1 unless success
end

task :default => :spec

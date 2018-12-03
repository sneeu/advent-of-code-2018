require "rake/testtask"

Rake::TestTask.new do |t|
  t.test_files = FileList['**/test_*.rb']
end
desc "Run tests"

task :run, [:day, :part] do |t, args|
  require_relative "./day#{args.day}/lib/part#{args.part}"
  puts main("day#{args.day}/input")
end

task default: :test

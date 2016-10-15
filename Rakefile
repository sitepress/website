task :build do
  sh "bundle exec ruby compile.rb"
end

task :deploy do
  sh "shart"
end

task default: %w[build deploy]

task :build do
  sh "bundle exec sitepress compile"
end

task :deploy do
  sh "aws s3 sync ./build s3://sitepress.cc/"
end

task default: %w[build deploy]

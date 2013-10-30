namespace :pkg do
  desc "Build the gem"
  task :gem do
    FileUtils.mkdir_p "pkg"
    sh "gem build ducks.gemspec"
    sh "mv *.gem pkg/"
  end
end

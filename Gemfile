source "https://rubygems.org"

# Ensure github repositories are fetched using HTTPS
git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  puts(repo_name)
  "https://github.com/#{repo_name}.git"
end if Gem::Version.new(Bundler::VERSION) < Gem::Version.new('2')

gem 'xcpretty', "0.3.0"

plugins_path = File.join(File.dirname(__FILE__), 'fastlane', 'Pluginfile')
eval_gemfile(plugins_path) if File.exist?(plugins_path)

begin
  require 'bundler/setup'
rescue LoadError
  puts 'You must `gem install bundler` and `bundle install` to run rake tasks'
end

require 'rdoc/task'

RDoc::Task.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'BootstrapGenerators'
  rdoc.options << '--line-numbers'
  rdoc.rdoc_files.include('README.rdoc')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

Bundler::GemHelper.install_tasks

require 'rake/testtask'

Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.libs << 'test'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = false
end

task default: :test

namespace :bootstrap do
  desc "Update to a new version of Twitter Bootstrap"
  task :update do
    require 'git'
    require 'fileutils'

    # Make sure tmp/ dir exists
    Dir.mkdir('tmp') unless File.exists?('tmp')

    if File.exists?('tmp/bootstrap')
      # TODO: Update Twitter Bootstrap repository
    else
      # Clone Twitter Bootstrap repository
      Dir.chdir('tmp') {
        Git.clone('https://github.com/twbs/bootstrap', 'bootstrap')
      }
    end

    if File.exists?('tmp/sass-twitter-bootstrap')
      # TODO: Update SASS Twitter Bootstrap repository
    else
      # Clone SASS Twitter Bootstrap repository
      Dir.chdir('tmp') {
        Git.clone('https://github.com/jlong/sass-twitter-bootstrap', 'sass-twitter-bootstrap')
      }
    end

    # Reset Twitter Bootstrap JS files
    FileUtils.rm Dir.glob('vendor/assets/javascripts/bootstrap/*.js')
    FileUtils.cp Dir.glob('tmp/bootstrap/js/*.js'), 'vendor/assets/javascripts/bootstrap'

    # Reset Twitter Bootstrap LESS files
    FileUtils.rm Dir.glob('vendor/twitter/bootstrap/less/*.less')
    FileUtils.cp Dir.glob('tmp/bootstrap/less/*.less'), 'vendor/twitter/bootstrap/less'

    # Reset Twitter Bootstrap SASS files
    FileUtils.rm Dir.glob('vendor/twitter/bootstrap/sass/*.scss')
    FileUtils.cp Dir.glob('tmp/sass-twitter-bootstrap/lib/*.scss'), 'vendor/twitter/bootstrap/sass'
  end
end

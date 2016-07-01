# encoding: utf-8

$LOAD_PATH.push File.expand_path('../lib', __FILE__)

require 'pivotal_git_scripts/version'

Gem::Specification.new do |gem|
  gem.name        = 'mavenlink-git-scripts'
  gem.version     = PivotalGitScripts::VERSION
  gem.authors     = ['Pivotal Labs, Mavenlink']
  gem.email       = ['gems@pivotallabs.com, dev@mavenlink.com']
  gem.homepage    = 'http://github.com/jrolfs/git-scripts'
  gem.summary     = 'Developer Git workflow convenience scripts'
  gem.description = 'These scripts are helpers for managing developer workflow when using Git repos hosted on GitHub.'

  gem.rubyforge_project = 'pivotal_git_scripts'

  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.require_paths = ['lib']
  gem.license       = 'MIT'

  gem.add_development_dependency 'rake', '~> 11.2', '>= 11.2.2'
  gem.add_development_dependency 'bundler', '~> 1.12', '>= 1.12.5'
  gem.add_development_dependency 'rspec', '~> 3.4'
  gem.add_development_dependency 'unindent', '~> 1.0'
  gem.add_development_dependency 'gem-release', '~> 0.7', '>= 0.7.4'
end

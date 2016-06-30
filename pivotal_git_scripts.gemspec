# encoding: utf-8

$LOAD_PATH.push File.expand_path('../lib', __FILE__)

require 'pivotal_git_scripts/version'

Gem::Specification.new do |gem|
  gem.name        = 'pivotal_git_scripts'
  gem.version     = PivotalGitScripts::VERSION
  gem.authors     = ['Pivotal Labs']
  gem.email       = ['gems@pivotallabs.com']
  gem.homepage    = 'http://github.com/pivotal/git_scripts'
  gem.summary     = 'Developer Git workflow convenience scripts'
  gem.description = 'These scripts are helpers for managing developer workflow when using Git repos hosted on GitHub.'

  gem.rubyforge_project = 'pivotal_git_scripts'

  gem.files         = `git ls-files`.split('\n')
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split('\n')
  gem.executables   = `git ls-files -- bin/*`.split('\n').map{ |f| File.basename(f) }
  gem.require_paths = ['lib']
  gem.license       = 'MIT'
end

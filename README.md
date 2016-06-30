# Git Scripts

These scripts are helpers for managing developer workflow when using git repositories hosted on GitHub.  Install as a RubyGem and they can be run as standard git commands, eg: `git about`.

[![Build Status](https://img.shields.io/travis/pivotal/git_scripts.svg)](https://travis-ci.org/pivotal/git_scripts)
[![Gem](https://img.shields.io/gem/v/mavenlink-git-scripts.svg?style=flat-square)]()

## Gem Installation

```shell
gem install mavenlink-git-scripts
```

## System Wide Installation

```shell
cd /usr/local/bin && curl -L http://github.com/pivotal/git-scripts/tarball/master | gunzip | tar xvf - --strip=2
```

## git-about

`git about` shows settings set by `git pair` and `git project`

## git-pair

Configures git authors when pair programming.

```shell
$ git pair sp js
user.name=Josh Susser & Sam Pierson
user.email=pair+jsusser+sam@pivotallabs.com
```

Create a `.pairs` config file in project root or your home folder.

```yaml
# .pairs - configuration for 'git pair'
pairs:
  # <initials>: <Firstname> <Lastname>[; <email-id>]
  eh: Edward Hieatt
  js: Josh Susser; jsusser
  sf: Serguei Filimonov; serguei
email:
  prefix: pair
  domain: pivotallabs.com
  no_solo_prefix: true
global: false  # Set to true for git-pair to change git configuration for all your projects
```


By default this affects the current project (`.git/config`).
Use the `--global` option or add `global: true` to your `.pairs` file to set the global git configuration for all projects (`~/.gitconfig`).

Options are:

    -g, --global                     Modify global git options instead of local
    -v, --version                    Show Version
    -h, --help                       Show this.

When you're done pairing, change git's configuration to use your personal details.

```shell
git pair <your-initials>
```

## git-pair-commit

Makes a git commit as normal, but chooses one of the pair members randomly to get credit for the commit on github (by setting the author email to that member's email address). The author name on the commit will list all members of the pair, as usual.

If pair members have email addresses on different domains, you can specify them separately in the optional `email_addresses:` key in your `.pairs` file.

If pair members would like to sign commits with a GPG key, you can specifiy them in the optional `gpg_keys:` sections in your `.pairs` file.

```yaml
pairs:
  jd: Jane Doe
  fb: Frances Bar
email_addresses:
  jd: jane@awesome.local
  fb: frances@foo.bar
gpg_keys:
  jd: A1B2C3D4
  fb: E5F6G7H8
```

### Using git-pair-commit in RubyMine
RubyMine already supports pointing at a custom location for your git executable in the Preferences -> Version Control -> Git
![RubyMine Git Configuration](http://i.imgur.com/hTHkdeA.png)
The trick then is that `pair-commit` doesn't encompass all git functionality, so you can't just point RubyMine directly at it, you need something in the middle that will use `pair-commit` if the first arg is `commit`, otherwise just pass through. Here's a ruby script to do just that:

```ruby
#!/usr/bin/env ruby

exit_code = if ARGV[1] == "commit"
  system "git pair-commit #{ARGV[1..-1].join(" ")}"
else
  system "git #{ARGV.join(" ")}"
end

exit exit_code
```

Make sure it's executable.


## git-project

```shell
git project pivots
```

This script sets the user account you will use to access repos hosted on github.com.  It creates a symlink from `id_github_current` to `id_github_pivotal<project>`, which switches the SSH key you are currently using to access GitHub repos.  Make sure you have the following lines in your .ssh/config file:

    Host github.com
      User git
      IdentityFile /Users/pivotal/.ssh/id_github_current

Authors
====
Copyright (c) 2010 [Pivotal Labs](http://pivotallabs.com). This software is licensed under the MIT License.

### [Contributors](https://github.com/pivotal/git_scripts/contributors)
 - git-pair original author [Bryan Helmkamp](http://brynary.com)
 - lots of pivots :)
 - [James Sanders](https://github.com/jsanders)
 - [Todd Persen](https://github.com/toddboom)

# puppet_repo

puppet repo with serverspec acceptance tests via ssh to a server.
The tests are stored in the repository rather than separately in /test/integration (as is the chef format)

This demonstrates using test-kitchen, puppet and kitchen-verifier-serverspec to build and verify a server that is in a cloud and accessible by ssh.


## Workstation Software Installation

The first thing you need to do is install the test-kitchen environment on your workstation.
A useful link is: http://misheska.com/blog/2013/12/26/set-up-a-sane-ruby-cookbook-authoring-environment-for-chef/

The follow instructions are for Windows PC (it will be similar for Mac):

1. Download and install the Windows RubyInstaller for 64 bit Ruby 2.1 from http://rubyinstaller.org/downloads.
   * Check the option to add ruby to your path.
2. Download and install the Windows Ruby DevKit for use with Ruby 2.0 and above (64bits version only) from http://rubyinstaller.org/downloads.
3. Configure the Ruby DevKit
   * In the devkit directory run “ruby dk.rb init”.
   * Check the config.yml generated has added the the path of the ruby install, if not add it manaully.
   * run “ruby dk.rb install” to bind it to the ruby installation.
4. Then install the following gems
  * gem install librarian-puppet
  * gem install test-kitchen
  * gem install kitchen-puppet
  * gem install kitchen-ssh
  * gem install kitchen-verifier-serverspec
7. git clone the repository https://github.com/neillturner/puppet_repo
8. review settings in the .kitchen.yml file

## Check everything installed
In a command window in the puppet_repo directory run command
```
kitchen list
```
This will return a list if everyting is correctly installed.

## Create Servers in Virtual Box on your Workstation.
```
kitchen create base-nocm-centos-65 -l debug
```

## Build the server.
```
kitchen converge base-nocm-centos-65 -l debug
```

## Verify the server.
```
kitchen verify base-nocm-centos-65 -l debug
```

## Shutdown the server.
```
kitchen destroy base-nocm-centos-65 -l debug
```

##





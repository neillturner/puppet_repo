# puppet_repo

puppet repo with serverspec acceptance tests in beaker directory format.
The tests are stored in the repository rather than separately in /test/integration (as is the chef format)

This demonstrates using test-kitchen, puppet and kitchen-verifier-serverspec to build and verify a server.


## Workstation Software Installation

The first thing you need to do is install the test-kitchen environment on your workstation.
A useful link is: http://misheska.com/blog/2013/12/26/set-up-a-sane-ruby-cookbook-authoring-environment-for-chef/

The follow instructions are for Windows PC (it will be similar for Mac):

1. Download and install virtualbox from https://www.virtualbox.org/wiki/Downloads.
2. Download and install Vagrant from https://www.vagrantup.com/downloads.html
3. Download and install the Windows RubyInstaller for 32 bit Ruby 2.1 from http://rubyinstaller.org/downloads.
   * Check the option to add ruby to your path.
4. Download and install the Windows Ruby DevKit for use with Ruby 2.0 and above (32bits version only) from http://rubyinstaller.org/downloads.
5. Configure the Ruby DevKit
   * In the devkit directory run “ruby dk.rb init”.
   * Check the config.yml generated has added the the path of the ruby install, if not add it manaully.
   * run “ruby dk.rb install” to bind it to the ruby installation.
6. Then install the following gems
  * gem install librarian-puppet
  * gem install test-kitchen
  * gem install kitchen-puppet
  * gem install kitchen-vagrant
  * gem install kitchen-verifier-serverspec
7. git clone the repository https://github.com/neillturner/puppet_repo
8. Either Run verify locally or remotely
  * Set environment variable KITCHEN_YAML to either .kitchen.localexec.yml or .kitchen.remote.yml
  * To run serverspec verify either locally from workstation or remotely on the server that is configured 
  * Review the kitchen yaml file, specifying an IP address that is part of your workstation private address space or
  use DHCP to let the network dynamically allocte IP address.
  
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

## Copy vagrant generated private key.
If using the .kitchen.localexec.yml so the verifier can access the server get the “private_key” file of the tomcat servers from directory
  puppet_repo/.kitchen/kitchen-vagrant/kitchen-puppet_repo-base-nocm-centos-65/.vagrant/machines/default/virtualbox
and copy to
  puppet_repo/private_key.pem

## Verify the server.
```
kitchen verify base-nocm-centos-65 -l debug
```

## Shutdown the server.
```
kitchen destroy base-nocm-centos-65 -l debug
```

##





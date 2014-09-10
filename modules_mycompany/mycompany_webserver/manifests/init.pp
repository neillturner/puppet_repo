# == Class: mycompany_webserver
#
# classes to run for the webserver role
# class parameters can be coded here or resolved via the hiera parameter hierachy 
#
class mycompany_webserver 
{

 class { 'apache': }
 
}

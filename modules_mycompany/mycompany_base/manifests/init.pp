# == Class: mycompany_base
#
# classes to run for the base role
# class parameters can be coded here or resolved via the hiera parameter hierachy
#
class mycompany_base
{

  notify { 'test': }
  notify { $::hello: }
# class { 'ntp': }

}

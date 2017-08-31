package Libs::Validators;

use strict;
use warnings;
use Data::Dumper;

sub new
{
    my $class = ref($_[0])||$_[0];
    my $self ||={};
    return bless $self,$class;
}

sub notEmpty
{
    my ($self,$query) = @_;
    if(length($query) > 1)
    {
        return 1;
    }
    else
    {
        print "check less 4 char";
    }
}

sub checkEmail
{
    my ($self, $email) = @_;
    my $reg ='/^([a-z0-9_\.-]+)@([a-z0-9_\.-]+)\.([a-z\.]{2,6})$/';
    if ($email =~ /$reg/i)
    {
        return 1;            
    }
    return 0;
}

#sub countChar
#{
   # my ($self,$query) = @_;
   # if(defined $query )
  ##  else
 #   {
  #      print "check filds";
  #  }
#}

1;

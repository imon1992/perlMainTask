package Libs::Validators;

use strict;
use warnings;
use Data::Dumper;
#use Email::Address;

sub new
{
    my $class = ref($_[0])||$_[0];
    my $self ||={};
    return bless $self,$class;
}

sub notEmpty
{
    my ($self,$query) = @_;
    if(length($query) > 4)
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
    my ($self,$query) = @_;
    my @addresses = Email::Address->parse($query);
    if(@addresses)
    {
        print 'valid';
        return 1;
    }
    else
    {
        print 'no valid';
    }
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

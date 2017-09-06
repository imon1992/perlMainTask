package Libs::Validators;

#user12
use strict;
use warnings;


sub new
{
    my $class = ref($_[0]) || $_[0];
    my $self ||= {};
    return bless $self, $class;
}

sub notEmpty
{
    my ($self, $query) = @_;
    if (length($query) > 1)
    {
        return 1;
    }
    else
    {
        return 0;
    }
}

sub checkEmail
{
    my ($self, $email) = @_;
    my $reg = '/^([a-z0-9_\.-]+)@([a-z0-9_\.-]+)\.([a-z\.]{2,6})$/';
    if ($email =~ /$reg/i)
    {
        return 1;
    }
    return 0;
}

1;

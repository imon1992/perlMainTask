package Model::UserModel;

use strict;
use warnings;

sub createUser;
sub updateUser;
sub selectUser;


sub new
{
    my $class = ref($_[0])||$_[0];
    my $self ||={};
    return bless $self,$class;
}

sub createUser 
{
}

sub updateUser
{
}

sub selectUser
{
}

1;


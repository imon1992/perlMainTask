package Controller::ProfileController;

use strict;
use warnings;

sub new
{
    my $class = ref($_[0])||$_[0];
    my $self ||={};
    return bless $self,$class;
}

sub profileController
{
    print "Content-type: text/html; charset=utf-8\n\n";
	print 'profile';
}


1;
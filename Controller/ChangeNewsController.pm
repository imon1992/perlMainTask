package Controller::ChangeNewsController;

use strict;
use warnings;

sub new
{
    my $class = ref($_[0])||$_[0];
    my $self ||={};
    return bless $self,$class;
}

sub changeNewsController
{
    print "Content-type: text/html; charset=utf-8\n\n";
	print 'change news';
}


1;
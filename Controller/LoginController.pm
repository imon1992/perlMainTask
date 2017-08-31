package Controller::LoginController;

use strict;
use warnings;

sub new
{
    my $class = ref($_[0])||$_[0];
    my $self ||={};
    return bless $self,$class;
}

sub loginController
{
	my($self,$login,$pass) = @_;
	
	#validate data
    print "Content-type: text/html; charset=utf-8\n\n";
	print 'login';
}


1;

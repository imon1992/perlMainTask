package Controller::LogoutController;

#user14
use strict;
use warnings;

sub logoutController;

sub new
{
    my $class = ref($_[0]) || $_[0];
    my $self ||= {};
    return bless $self, $class;
}

sub logoutController
{
    my $url = "script.cgi";
    my $t = 0;
    print "<META HTTP-EQUIV=refresh CONTENT=\"$t;URL=$url\">\n";

}


1;

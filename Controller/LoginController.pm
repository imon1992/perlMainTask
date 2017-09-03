package Controller::LoginController;

use strict;
use warnings;

use Model::UserModel;

sub loginController;

sub new
{
    my $class = ref($_[0]) || $_[0];
    my $self ||= {};
    return bless $self, $class;
}

sub loginController
{
    my ($self, $login, $pass) = @_;
    my $user = Model::UserModel->new();
    my $userId = $user->selectUser($login, $pass);

    if ($userId)
    {

        my $url = "script.cgi?profile=1&userid=$userId";
        my $t = 0; # time until redirect activates
        print "<META HTTP-EQUIV=refresh CONTENT=\"$t;URL=$url\">\n";

    }

}


1;

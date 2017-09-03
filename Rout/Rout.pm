package Rout::Rout;

use strict;
use warnings;

use CGI qw(:cgi-lib);

use Controller::IndexController;
use Controller::RegisterController;
use Controller::LoginController;
use Controller::ProfileController;
use Controller::AddNewsController;
use Controller::ChangeProfileController;
use Controller::ChangeNewsController;
use Controller::LogoutController;

use vars qw(%in);

sub rout;

sub new
{
    my $class = ref($_[0]) || $_[0];
    my $self ||= {};
    return bless $self, $class;
}

sub rout
{

    my $query = $ENV{QUERY_STRING};
    $| = 1;
    ReadParse();

    if ($in{passwordChange} && $in{emailChange} && $in{firstNameChange} && $in{lastNameChange})
    {
        my $changeProfile = Controller::ChangeProfileController->new();
        $changeProfile->changeProfileController($in{passwordChange}, $in{emailChange}, $in{firstNameChange}, $in{lastNameChange}, $in{userid});

    }

    if ($in{login} && $in{password})
    {

        my $login = Controller::LoginController->new();
        $login->loginController($in{login}, $in{password});

    }

    if ($in{titleAdd} && $in{newsTextAdd})
    {
        my $addNews = Controller::AddNewsController->new();
        $addNews->addNewsController($in{titleAdd}, $in{newsTextAdd}, $in{userid});
    }

    if ($in{titleChange} && $in{textChange})
    {
        #                print Dumper($in{userid});
        my $changeNews = Controller::ChangeNewsController->new();
        $changeNews->changeNewsController($in{titleChange}, $in{textChange}, $in{newsid}, $in{userid});
    }

    if ($in{loginRegister} && $in{passwordRegister} && $in{emailRegister} && $in{firstNameRegister} && $in{lastNameRegister})
    {
        my $register = Controller::RegisterController->new();
        $register->registerController($in{loginRegister}, $in{passwordRegister}, $in{emailRegister}, $in{firstNameRegister}, $in{lastNameRegister});

    }

    if ($query eq '')
    {

        my $index = Controller::IndexController->new();
        $index->indexController($in{userid}, \%in);
    }

    if ($query eq 'register')
    {
        my $register = Controller::RegisterController->new();
        $register->registerController();
    }

    if ($query eq 'logout')
    {
        my $register = Controller::LogoutController->new();
        $register->logoutController();
    }

    if ($in{profile} eq '1' || $query eq 'profile')
    #    if($query eq 'profile')
    {
        my $profile = Controller::ProfileController->new();
        $profile->profileController($in{userid});
    }

    if ($in{addNews} eq '1')
    {
        my $addNews = Controller::AddNewsController->new();
        $addNews->addNewsController('', '', $in{userid});
    }

    if ($in{changeProfile} eq '1')
    {
        my $changeProfile = Controller::ChangeProfileController->new();
        $changeProfile->changeProfileController('', '', '', '', $in{userid});
    }

    if ($in{changeNews} eq '1')
    {
        my $changeNews = Controller::ChangeNewsController->new();
        $changeNews->changeNewsController('', '', $in{newsid}, $in{userid});
    }

}


1;

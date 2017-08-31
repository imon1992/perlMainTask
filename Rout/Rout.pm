package Rout::Rout;

use strict;
use warnings;

use CGI qw(:cgi-lib :escapeHTML :unescapeHTML);

use Data::Dumper;
use Controller::IndexController;
use Controller::RegisterController;
use Controller::LoginController;
use Controller::ProfileController;
use Controller::AddNewsController;
use Controller::ChangeProfileController;
use Controller::ChangeNewsController;

use vars qw(%in);

sub rout;



sub new
{
    my $class = ref($_[0])||$_[0];
    my $self ||={};
    return bless $self,$class;
}

sub rout
{
    
    
    my $query = $ENV{QUERY_STRING};
    $|=1;
    ReadParse();
    
    if($query eq '')
    {
        my $index = Controller::IndexController->new();
        $index->indexController();
    }

    if($query eq 'register')
    {
        my $register = Controller::RegisterController->new();
        $register->registerController();
    }

    if($query eq 'profile')
    {
        my $profile = Controller::ProfileController->new();
        $profile->profileController();
    }
        
    if($query eq 'addNews')
    {
        my $addNews = Controller::AddNewsController->new();
        $addNews->addNewsController();
    }
    
    
    if($query eq 'changeProfile')
    {
        my $changeProfile = Controller::ChangeProfileController->new();
        $changeProfile->changeProfileController();
    }
    
    
    if($query eq 'changeNews')
    {
        my $changeNews = Controller::ChangeNewsController->new();
        $changeNews->changeNewsController();
    }
    

    if($in{login} && $in{password})
    {

        my $login = Controller::LoginController->new();
        $login->loginController($in{login},$in{password});
                
                
        $in{login}  = '';
        $in{password} ='';
    }

    if($in{loginRegister} && $in{passwordRegister} && $in{emailRegister} && $in{firstNameRegister} && $in{lastNameRegister})
    {
        my $register = Controller::RegisterController->new();
        $register->registerController($in{loginRegister}, $in{passwordRegister},$in{emailRegister},$in{firstNameRegister},$in{lastNameRegister});        
           
    }


}


1;
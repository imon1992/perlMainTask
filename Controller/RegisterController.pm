package Controller::RegisterController;

#user13
use strict;
use warnings;

use Libs::FileReader;
use Libs::Validators;
use View::Main;
use Model::UserModel;

sub new
{
    my $class = ref($_[0]) || $_[0];
    my $self ||= {};
    return bless $self, $class;
}

sub registerController
{

    my ($self, $login, $pass, $email, $fName, $lName) = @_;
    if ($login eq '' || $pass eq '' || $email eq '' || $fName eq '' || $lName eq '')
    {
        my $fileReader = Libs::FileReader->new();
        my $registerHtml = $fileReader->readFile('html/registerForm.html');

        my $view = View::Main->new();
        $view->printMain($registerHtml);
    }
    my $validator = Libs::Validators->new();


    unless ($login eq '' && $pass eq '' && $email eq '' && $fName eq '' && $lName eq '') {

        my $x = Model::UserModel->new();
        $x->createUser($login, $pass, $email, $fName, $lName);

    }
}


1;

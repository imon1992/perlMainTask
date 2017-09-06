package Controller::ChangeProfileController;

#user14
use strict;
use warnings;

use View::Main;
use Libs::ChangeInfo;
use Libs::ProfileMaker;

sub changeProfileController;

sub new
{
    my $class = ref($_[0]) || $_[0];
    my $self ||= {};
    return bless $self, $class;
}

sub changeProfileController
{
    my ($self, $pass, $email, $fName, $lName, $userId) = @_;

    if ( $email eq '' || $fName eq '' || $lName eq '')
    {

        my $user = Model::UserModel->new();
        my $userInfo = $user->selectAllUserInfo($userId);

        my $changeInfo = Libs::ChangeInfo->new();
        my $changePage = $changeInfo->ChangeInfo('',
            $userInfo->{0}->{email},
            $userInfo->{0}->{first_name},
            $userInfo->{0}->{last_name}, $userId);

        my $main = View::Main->new();
        $main->printMain($changePage);
    }else {

        my $user = Model::UserModel->new();
        $user->updateUser($pass, $email, $fName, $lName, $userId);

        my $profile = Libs::ProfileMaker->new();
        my $profileInfo = $profile->profileMaker($userId);

        my $view = View::Main->new();
        $view->printMain($profileInfo);
    }

}


1;

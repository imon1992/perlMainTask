package Controller::ChangeProfileController;

use strict;
use warnings;
use View::Main;
#use Model::UserModel;
use Libs::ChangeInfo;
use Data::Dumper;

sub new
{
    my $class = ref($_[0])||$_[0];
    my $self ||={};
    return bless $self,$class;
}

sub changeProfileController
{
	my($self,$pass,$email,$fName,$lName,$userId) = @_;

	if( $pass eq '' || $email eq '' || $fName eq ''|| $lName eq '')
	{
        my $user = Model::UserModel->new();
        my $userInfo = $user->selectAllUserInfo($userId);

        my $changeInfo = Libs::ChangeInfo->new();
        my $changePage = $changeInfo->ChangeInfo('',
        $userInfo->{0}->{email},
        $userInfo->{0}->{first_name},
        $userInfo->{0}->{last_name},$userId);

        my $main = View::Main->new();
        $main->printMain($changePage);
	}else{
        my $user = Model::UserModel->new();
        my $userInfo = $user->updateUser($pass,$email,$fName,$lName,$userId);
	}

}


1;
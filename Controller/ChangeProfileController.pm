package Controller::ChangeProfileController;

use strict;
use warnings;

use View::Main;
use Libs::ChangeInfo;

sub new
{
    my $class = ref($_[0]) || $_[0];
    my $self ||= {};
    return bless $self, $class;
}

sub changeProfileController
{
    my ($self, $pass, $email, $fName, $lName, $userId) = @_;

    if ($pass eq '' || $email eq '' || $fName eq '' || $lName eq '')
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
        my $x = Model::NewsModel->new();
        my $allNews = $x->selectNews();
        my $userNews = $x->selectNewsByUserId($userId);

        my $user = Model::UserModel->new();
        my $userInfo = $user->selectAllUserInfo($userId);

        my $index = View::RenderNews->new();
        my $allNews = $index->renderNews($allNews);

        my $profile = View::RenderProfile->new();
        my $profileResult = $profile->renderUserInfo($userInfo, $userNews);

        my $fileReader = Libs::FileReader->new();
        my $register = $fileReader->readFile('html/logout.html');
        my $replaceFile = $fileReader->readFile('html/main.html');

        my $hashMake = Libs::MakeHash->new();
        my $hash = $hashMake->makeHash($register, $allNews, $profileResult);

        my $placeholderReplace = Libs::PlaceholderReplace->new();
        my $html = $placeholderReplace->replacer($replaceFile, $hash);

        my $view = View::Main->new();
        $view->printMain($html);
    }

}


1;
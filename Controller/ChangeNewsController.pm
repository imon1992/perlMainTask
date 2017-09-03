package Controller::ChangeNewsController;

use strict;
use warnings;

use View::Main;
use Model::NewsModel;
use Libs::ChangeNews;
use Data::Dumper;

sub new
{
    my $class = ref($_[0]) || $_[0];
    my $self ||= {};
    return bless $self, $class;
}

sub changeNewsController
{
    my ($self, $title, $text, $newsId, $userId) = @_;
    if ($title eq '' || $text eq '')
    {

        my $user = Model::NewsModel->new();
        my $newsInfo = $user->selectNewsById($newsId);

        my $changeInfo = Libs::ChangeNews->new();
        my $changePage = $changeInfo->ChangeNews($newsInfo->{0}->{title}, $newsInfo->{0}->{text}, $newsId, $userId);

        my $main = View::Main->new();
        $main->printMain($changePage);
    }else {

        my $user = Model::NewsModel->new();
        $user->updateNews($title, $text, $newsId);
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

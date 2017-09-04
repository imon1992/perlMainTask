package Controller::ChangeNewsController;

#user 14
use strict;
use warnings;

use View::Main;
use Model::NewsModel;
use Libs::ChangeNews;
use Libs::ProfileMaker;


sub changeNewsController;

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

        my $profile = Libs::ProfileMaker->new();
        my $profileInfo = $profile->profileMaker($userId);

        my $view = View::Main->new();
        $view->printMain($profileInfo);
    }
}


1;

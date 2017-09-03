package Controller::AddNewsController;

use strict;
use warnings;

use View::Main;
use Libs::AddNews;

sub addNewsController;

sub new
{
    my $class = ref($_[0]) || $_[0];
    my $self ||= {};
    return bless $self, $class;
}

sub addNewsController
{
    my ($self, $title, $text, $userId) = @_;
    if ($title eq '' || $text eq '')
    {

        my $changeInfo = Libs::AddNews->new();
        my $changePage = $changeInfo->addNews($userId);

        my $main = View::Main->new();
        $main->printMain($changePage);
    }else
    {
        my $user = Model::NewsModel->new();
        $user->createNews($title, $text, $userId);
    }
}


1;

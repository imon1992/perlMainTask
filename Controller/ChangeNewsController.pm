package Controller::ChangeNewsController;

use strict;
use warnings;
use View::Main;
use Model::NewsModel;
use Libs::ChangeNews;
use Data::Dumper;

sub new
{
    my $class = ref($_[0])||$_[0];
    my $self ||={};
    return bless $self,$class;
}

sub changeNewsController
{
	my($self,$title,$text,$newsId) = @_;
	if( $title eq '' || $text eq '')
	{
#	print Dumper($newsId);
        my $user = Model::NewsModel->new();
        my $newsInfo = $user->selectNewsById($newsId);

        my $changeInfo = Libs::ChangeNews->new();
        my $changePage = $changeInfo->ChangeInfo($newsInfo->{0}->{title},$newsInfo->{0}->{text},$newsId);

        my $main = View::Main->new();
        $main->printMain($changePage);
	}else{

	            my $user = Model::NewsModel->new();
                my $newsInfo = $user->updateNews($title,$text,$newsId);
	}
}


1;
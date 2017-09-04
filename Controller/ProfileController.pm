package Controller::ProfileController;

#user14
use strict;
use warnings;

use View::RenderNews;
use View::RenderProfile;
use View::Main;
use Model::NewsModel;
use Model::UserModel;
use Libs::FileReader;
use Libs::MakeHash;
use Libs::PlaceholderReplace;
use Libs::ProfileMaker;

sub profileController;

sub new
{
    my $class = ref($_[0]) || $_[0];
    my $self ||= {};
    return bless $self, $class;
}

sub profileController
{

    my ($self, $userId) = @_;

    my $profile = Libs::ProfileMaker->new();
    my $profileInfo = $profile->profileMaker($userId);

    my $view = View::Main->new();
    $view->printMain($profileInfo);
}


1;

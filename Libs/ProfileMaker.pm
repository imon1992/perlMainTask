package Libs::ProfileMaker;

#user14
use strict;
use warnings;

use Model::NewsModel;
use Model::UserModel;
use View::RenderNews;
use View::RenderProfile;
use Libs::MakeHash;
use Libs::PlaceholderReplace;


sub profileMaker;

sub new
{
    my $class = ref($_[0]) || $_[0];
    my $self ||= {};
    return bless $self, $class;
}

sub profileMaker
{
    my($self,$userId)  =@_;
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

    return $html;
}

1;
package Controller::IndexController;

use strict;
use warnings;

use View::RenderNews;
use View::Main;
use Model::NewsModel;
use Libs::FileReader;
use Libs::MakeHash;
use Libs::PlaceholderReplace;
use Data::Dumper;
sub new
{
    my $class = ref($_[0]) || $_[0];
    my $self ||= {};
    return bless $self, $class;
}

sub indexController
{

    my ($self) = @_;

    my $x = Model::NewsModel->new();
    my $res = $x->selectNews();

    my $index = View::RenderNews->new();
    my $allNews = $index->renderNews($res);

    my $fileReader = Libs::FileReader->new();
    my $register = $fileReader->readFile('html/registerLogin.html');
    my $replaceFile = $fileReader->readFile('html/main.html');

    my $hashMake = Libs::MakeHash->new();
    my $hash = $hashMake->makeHash($register, $allNews, '');

    my $placeholderReplace = Libs::PlaceholderReplace->new();
    my $html = $placeholderReplace->replacer($replaceFile, $hash);

    my $view = View::Main->new();
    $view->printMain($html);

}


1;

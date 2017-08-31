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
    my $class = ref($_[0])||$_[0];
    my $self ||={};
    return bless $self,$class;
}

sub indexController
{
    # print "Content-type: text/html; charset=utf-8\n\n";
    my $x = Model::NewsModel->new();
    my $res = $x->selectNews();
    
    # print Dumper($res->{1});
    my $index = View::RenderNews->new();
    my $allNews = $index->renderNews($res);
    
    my $fileReader = Libs::FileReader->new();
    my $register = $fileReader->readFile('html/registerLogin.html');
    my $replaceFile = $fileReader->readFile('html/main.html');
    
    my $hashMake = Libs::MakeHash->new();
    my $hash = $hashMake->makeHash($register,$allNews,'');
    
    my $placeholderReplace = Libs::PlaceholderReplace->new();
    my $html = $placeholderReplace->replacer($replaceFile,$hash);
<<<<<<< HEAD
    print $html;

=======
    
    my $view = View::Main->new();
    $view->printMain($html);
    # print $html;
    
>>>>>>> 7e25be841aaa9b700e2e21861f447dc517298509
    # print "Content-type: text/html; charset=utf-8\n\n";
    # my $fileReader = Utils::File->new();
# my $file = $fileReader->readFile('registerLogin.html');
# #print Dumper($file);

# my $fileHtml = $fileReader->readFile('main.html');
# my $sub = Utils::Substitutor->new();

# my $langs = $sub->makeHash('LANG_register',$file);

# #print Dumper($langs);
# my $parser = Utils::Parser->new();

# my $result = $parser->parser($fileHtml,$langs);

# print $result;


}


1;

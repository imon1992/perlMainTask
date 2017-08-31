package Controller::LoginController;

use strict;
use warnings;

use Model::UserModel;
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

sub loginController
{
	my($self,$login,$pass) = @_;
	my $x = Model::UserModel->new();
    my $p = $x->selectUser($login,$pass);
    print $p; 
if($p)
{    
       my $url="script.cgi?profile";
   my $t=0; # time until redirect activates
   print "<META HTTP-EQUIV=refresh CONTENT=\"$t;URL=$url\">\n";

#     my $x = Model::NewsModel->new();
#     my $res = $x->selectNews();

     # print Dumper($res->{1});
#     my $index = View::RenderNews->new();
#3     my $allNews = $index->renderNews($res);

 #    my $fileReader = Libs::FileReader->new();
 #    my $register = $fileReader->readFile('html/logout.html');
  #   my $replaceFile = $fileReader->readFile('html/main.html');
#
 #    my $hashMake = Libs::MakeHash->new();
  #   my $hash = $hashMake->makeHash($register,$allNews,'portfolio');

   #  my $placeholderReplace = Libs::PlaceholderReplace->new();
    # my $html = $placeholderReplace->replacer($replaceFile,$hash);

    # my $view = View::Main->new();
    # $view->printMain($html);
    }


	#validate data
 #   print "Content-type: text/html; charset=utf-8\n\n";
#	print 'login';
}


1;

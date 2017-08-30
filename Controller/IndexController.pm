package Controller::IndexController;

use strict;
use warnings;

use View::Main;
sub new
{
    my $class = ref($_[0])||$_[0];
    my $self ||={};
    return bless $self,$class;
}

sub indexController
{
    my $index = View::Main->new();
    $index->printMain();
    
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
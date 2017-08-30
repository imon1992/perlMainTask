package Model::NewsModel;

use strict;
use warnings;

use DBI;
sub createNewsl;
sub updateNews;
sub selectNews;
sub deleteNews;

sub new
{
    my $class = ref($_[0])||$_[0];
    my $self ||={};
    return bless $self,$class;
}

sub dbConnect
{
  #  DBI:mysql:database=DATABASENAME;host=HOSTNAME
    my $dbh = DBI->connect('DBI:mysql:database=user14;host=localhost','user14','tuser14');
    return $dbh; 
}

sub createNews
{
}

sub updateNews
{
}

sub selectNews
{
        my ($self) = @_;
    my %lengs = ();
    my $dbh = $self->dbConnect();
    my $sth =  $dbh->prepare('SELECT * FROM news');
    my $result = $sth->execute();
   print $result;
     
    while (my @row = $sth->fetchrow_array)
    {
      # print @row;
        $lengs{LANG_new} =$row[1];
        $lengs{LANG_new} .= $row[2];
    }
    return %lengs;
}

sub deleteNews
{
    
}

1;


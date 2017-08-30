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
    my %a;
    my $dbh = $self->dbConnect();
    my $sth =  $dbh->prepare('SELECT * FROM news');
    my $result = $sth->execute();
   #print $result;
    my $i =0;  
    while (my @row = $sth->fetchrow_array)
    {
      print @row;

        $lengs{$i} = $a{a} =( @row[1],$row[3]) ;

        #print $lengs;
        #$lengs= $row[2];
        $i++;
    }
    return \%lengs;
}

sub deleteNews
{
    
}

1;


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

sub _dbConnect
{
  #  DBI:mysql:database=DATABASENAME;host=HOSTNAME
  # my $dbh = DBI->connect('DBI:mysql:database=user14;host=localhost','user14','tuser14');
    my $dbh = DBI->connect('DBI:mysql:database=user1;host=localhost','root','');
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
    my %news = ();

    my $dbh = $self->_dbConnect();
    my $sth =  $dbh->prepare('select users.login, news.* from news
join users on news.user_id = users.id');
    my $result = $sth->execute();
    my $i =0;  
    while (my $row = $sth->fetchrow_hashref)
    {
        $news{$i} = $row;
        $i++;
    }
    return \%news;
}

sub deleteNews
{
    
}

1;


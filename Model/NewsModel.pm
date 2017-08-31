package Model::NewsModel;

use strict;
use warnings;
use Time::localtime;


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
  my $dbh = DBI->connect('DBI:mysql:database=user14;host=localhost','user14','tuser14');
 #   my $dbh = DBI->connect('DBI:mysql:database=user1;host=localhost','root','');;
    return $dbh; 
}

sub createNews
{
    my($self, $title, $text, $user_id) = @_;
    my $date = localtime;
    my $dbh = $self->_dbConnect();
    my $sth = $dbh->prepare("insert into news (title, text, date, user_id)
                                values ($title, $text, $date,  $user_id");

    if ($sth->execute())
    {
        $sth->finish();
        return "Create news";
    }
}

sub updateNews
{

    my($self, $id, $title, $text,) = @_;
    my $date = localtime;
    my $dbh = $self->_dbConnect();
    my $sth = $dbh->prepare("update news set title = $title, text = $text, date = $date,
                where id = $id");
    if ($sth->execute())
    {
        $sth->finish();
        return "News update";
    }

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
    my($self, $id) = @_;
    my $dbh = $self->_dbConnect();
    my $sth = $dbh->prepare("delete from news where id = $id");
    if ($sth->execute())
    {
        $sth->finish();
        return "News delete";
    }
}

1;


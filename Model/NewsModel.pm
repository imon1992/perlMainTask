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
                                values (?,?,?,?");

    if ($sth->execute($title,$text,$date,$user_id))
      {
          $sth->finish();
          return "Create news";
     }
 }

 sub updateNews
 {

      my($self, $title, $text,$id) = @_;
      my $date = localtime;
      my $dbh = $self->_dbConnect();

     my $sth = $dbh->prepare("update news set title = ?, text = ?, date = ?,
                where id = ?");
    if ($sth->execute($title,$text,$date,$id))
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

  sub selectNewsById
  {
      my ($self,$userId) = @_;
      my %news = ();
      my $dbh = $self->_dbConnect();
      my $sth =  $dbh->prepare('select * from news where id = ?');
      my $result = $sth->execute($userId);
      my $i =0;
      while (my $row = $sth->fetchrow_hashref)
      {
          $news{$i} = $row;
          $i++;
      }
      return \%news;
  }

    sub selectNewsByUserId
    {
        my ($self,$userId) = @_;
        my %news = ();
        my $dbh = $self->_dbConnect();
        my $sth =  $dbh->prepare('select * from news where user_id = ?');
        my $result = $sth->execute($userId);
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

   my $sth = $dbh->prepare("delete from news where id = ?");
   if ($sth->execute($id))
      {
          $sth->finish();
          return "News delete";
     }
 }

1;


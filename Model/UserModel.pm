package Model::UserModel;

use strict;
use warnings;

sub createUser;
sub updateUser;
sub selectUser;


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
    return $dbh;
}

sub createUser 
{
    my ($self,$login,$pass,$email,$fName,$lName) = @_;
    my %news = ();

    my $dbh = $self->_dbConnect();
    my $sth =  $dbh->prepare("INSERT INTO users(login,password,email,first_name,last_name) VALUES($login,$pass,$email,$fName,$lName)");
    my $result = $sth->execute();
}

sub updateUser
{
}

sub selectUser
{
}

1;


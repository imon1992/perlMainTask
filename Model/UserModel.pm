package Model::UserModel;

use strict;
use warnings;
use Digest::MD5 qw(md5 md5_hex md5_base64);

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
    my $sth =  $dbh->prepare("INSERT INTO users(login,password,email,first_name,last_name) VALUES($login,$pass=md5($pass),$email,$fName,$lName)");
    my $result = $sth->execute();
}

sub updateUser
{
    my ($self,$login,$pass,$email,$fName,$lName,$id) = @_;
    my $dbh = $self->_dbConnect();
    my $sth = $dbh->prepare("update users set login = $login, password = $pass=md5($pass),
                            email = $email, first_name = $fName, last_name = $lName  where id = $id");
    if ($sth->execute())
    {
        $sth->finish();
        return "User update";
    }
}

sub selectUser
{
    my($self,$login,$pass) = @_;
    my $dbh = $self->_dbConnect();
    my $sth = $dbh->prepare("select * from users WHERE login = $login AND password = $pass");
    $sth->execute();
    if ($sth->rows)
    {
        return 1;
    }

}



1;


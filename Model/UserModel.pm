package Model::UserModel;

use strict;
use warnings;

use Digest::MD5 qw(md5 md5_hex md5_base64);

sub createUser;
sub updateUser;
sub selectUser;


sub new
{
    my $class = ref($_[0]) || $_[0];
    my $self ||= {};
    return bless $self, $class;
}

sub _dbConnect
{
    #  DBI:mysql:database=DATABASENAME;host=HOSTNAME
    my $dbh = DBI->connect('DBI:mysql:database=user14;host=localhost', 'user14', 'tuser14');
    return $dbh;
}

sub createUser
{
    my ($self, $login, $pass, $email, $fName, $lName) = @_;
    my $dbh = $self->_dbConnect();
    my $ctx = Digest::MD5->new;
    my $sth = $dbh->prepare("INSERT INTO users(login,password,email,first_name,last_name) VALUES(?,?,?,?,?)");
    my $result = $sth->execute($login, md5($pass), $email, $fName, $lName);
}

sub updateUser
{
    my ($self, $pass, $email, $fName, $lName, $id) = @_;
    my $dbh = $self->_dbConnect();
    my $res;
    my $sth;
    if ($pass== undef) {
        $sth = $dbh->prepare("update users set
        email = ?, first_name = ?, last_name = ?  where id = ?");
        $res = $sth->execute( $email, $fName, $lName, $id);
    }else{
        $sth = $dbh->prepare("update users set password = ?,
        email = ?, first_name = ?, last_name = ?  where id = ?");
        $res = $sth->execute(md5($pass), $email, $fName, $lName, $id);
    }

    if ($res)
    {
        $sth->finish();
        return "User update";
    }
}

sub selectUser
{
    my ($self, $login, $pass) = @_;
    my $userId;
    my $dbh = $self->_dbConnect();
    my $sth = $dbh->prepare("select id from users where login = ? and password = ? ");
    my $x = $sth->execute($login, md5($pass));
    while (my $row = $sth->fetchrow_hashref)
    {
        $userId = $row->{id};
    }

    return $userId;
}

sub selectAllUserInfo
{

    my ($self, $userId) = @_;
    my %userInfo = ();

    my $dbh = $self->_dbConnect();
    my $sth = $dbh->prepare("select * from users WHERE id = ?");
    my $result = $sth->execute($userId);
    my $i = 0;
    while (my $row = $sth->fetchrow_hashref)
    {
        $userInfo{$i} = $row;
        $i++;
    }
    return \%userInfo;
}


1;


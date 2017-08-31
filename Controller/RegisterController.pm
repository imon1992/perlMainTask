package Controller::RegisterController;

use strict;
use warnings;

use Libs::FileReader;
use Libs::Validators;
use View::Main;
use Model::UserModel;
 
sub new
{
    my $class = ref($_[0])||$_[0];
    my $self ||={};
    return bless $self,$class;
}

sub registerController
{
#	     print "Content-type: text/html; charset=utf-8\n\n";
	
	my($self,$login,$pass,$email,$fName,$lName) = @_;
	if($login eq '' || $pass eq '' || $email eq '' || $fName eq ''|| $lName eq '')
	{
	    my $fileReader = Libs::FileReader->new();
	    my $registerHtml = $fileReader->readFile('html/registerForm.html');
	    
	    my $view = View::Main->new();
	    $view->printMain($registerHtml);
	}
    my $validator = Libs::Validators->new();
    

	unless($login eq '' && $pass eq '' && $email eq '' && $fName eq ''&& $lName eq ''){
	    #validate data and save if all is good redirect to start
	    #if valid data
#          if($validator->notEmpty($login) && $validator->notEmpty($pass) && $validator->notEmpty($email) &&  $validator->notEmpty($fName)
 #               && $validator->notEmpty($lName))
  #  {
 #      my $url="script.cgi?register";
 #  my $t=0; # time until redirect activates
 #  print "<META HTTP-EQUIV=refresh CONTENT=\"$t;URL=$url\">\n";


	        my $x = Model::UserModel->new();
            my $res = $x->createUser($login,$pass,$email,$fName,$lName);
#}
#else
#{
#      my $url="script.cgi?register";
#  my $t=0; # time until redirect activates
#  print "<META HTTP-EQUIV=refresh CONTENT=\"$t;URL=$url\">\n";

#}
}
}


1;

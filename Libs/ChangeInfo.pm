package Libs::ChangeInfo;

use strict;
use warnings;
use Data::Dumper;
sub new
{
    my $class = ref($_[0])||$_[0];
    my $self ||={};
    return bless $self,$class;
}

sub ChangeInfo{
   my($self,$pass,$email,$fName,$lName,$id) = @_;
    my $html = '<!DOCTYPE HTML>
                <html>
                <head>
                    <meta charset="utf-8">
                    <title>Стили</title>
                    <link rel="stylesheet" href="style.css">
                </head>
                <html>
                <body>
                <div class="block">';
    $html .= '    <form method="post" action="script.cgi?profile">
                        new password <input class="block" name="passwordChange" value="'.$pass.'">
                        email <input class="block" name="emailChange" value="'.$email.'">
                        First Name <input class="block" name="firstNameChange" value="'.$fName.'">
                        Last Name <input class="block" name="lastNameChange" value="'.$lName.'">
                        <input type="hidden" class="block" name="userid" value="'.$id.'">


                        <button type="submit">Change</button>
                    </form>';
    $html .= '</div>


              </body>
              </html>';
     return $html;
}


1;
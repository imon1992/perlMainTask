package Libs::ChangeNews;

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
   my($self,$title,$text,$newsId) = @_;
    my $html = '<!DOCTYPE HTML>
                <html>
                <head>
                    <meta charset="utf-8">
                    <title>Стили</title>
                    <link rel="stylesheet" href="style.css">
                </head>
                <html>
                <body>
                <div>';

                    $html .= '    <form method="post" action="script.cgi?profile">
                                      title <input class="block" name="titleChange" value="'.$title.'">
                                      News text <textarea class="block" name="textChange" rows="10" cols="45">'. $text.'</textarea>
<input type="hidden" class="block" name="newsid" value="'.$newsId.'">
                                      <button type="submit">change</button>
                                  </form>';
    $html .= '</div>


              </body>
              </html>';
     return $html;
}


1;
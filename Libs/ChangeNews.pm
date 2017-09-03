package Libs::ChangeNews;

#user14
use strict;
use warnings;

sub ChangeNews;

sub new
{
    my $class = ref($_[0]) || $_[0];
    my $self ||= {};
    return bless $self, $class;
}

sub ChangeNews {
    my ($self, $title, $text, $newsId, $userId) = @_;

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

    $html .= '    <form method="post" action="script.cgi?profile=1&userid='.$userId.'">
                                      title <input class="block" name="titleChange" value="'.$title.'">
                                      News text <textarea class="block" name="textChange" rows="10" cols="45">'. $text.'</textarea>
                                        <input type="hidden" class="block" name="newsid" value="'.$newsId.'">
                                        <input type="hidden" class="block" name="userid" value="'.$userId.'">
                                      <button type="submit">change</button>
                                  </form>';
    $html .= '</div>


              </body>
              </html>';
    return $html;
}


1;
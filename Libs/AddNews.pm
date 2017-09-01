 package Libs::AddNews;

 use strict;
 use warnings;
 use Data::Dumper;
 
sub new
 {
     my $class = ref($_[0])||$_[0];
     my $self ||={};
     return bless $self,$class;
 }

sub addNews
{
    my($self,$userId) = @_;

    my $html ='  <!DOCTYPE HTML>
  <html>
  <head>
     <meta charset="utf-8">
      <title>С�~Bили</title>
      <link rel="stylesheet" href="style.css">
  </head>
  <html>
  <body>
  <div class="block">
      <form method="post" action="script.cgi">
          title <input class="block" name="titleAdd">
          News text <textarea class="block" name="newsTextAdd" rows="10" cols="45"> </textarea>
<input type="hidden" class="block" name="userid" value="'.$userId.'"> 
          <button type="submit">add</button>
      </form>
  </div>
 
 
  </body>
  </html>
';
}

1;

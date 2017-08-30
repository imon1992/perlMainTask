package View::Main;

use strict;
use warnings;
use Data::Dumper;
sub new
{
    my $class = ref($_[0])||$_[0];
    my $self ||={};
    return bless $self,$class;
}

sub printMain{
print "Content-type: text/html; charset=utf-8\n\n";
my $html = 
'
<!DOCTYPE HTML>
<html>
 <head>
  <meta charset="utf-8">
  <title>Стили</title>
  <link rel="stylesheet" href="style.css">
 </head>
<html>
<body>


LANG_register

';

my @d1 = ('10.04.15','some text','some author');
# print @d1;
my@d2 = ('10.04.15','some text','some else author');
# my@d5 = ('10.0add15','somdsadat','sosdadasauthor');
my %d3 =(1=>\@d1,2=>\@d2);
print Dumper($d3{1}[1]);
# @d1

foreach my $key(keys %d3)
{
   my $a = $d3{$key}; 
   # print  $a->[0];
   $html .= "<div> <p> $a->[0] </p>
                   <p> $a->[1] </p>
                   <p> $a->[2] </p>
             </div>";
}

my $x = '<div >




<div>


<div>

<div>


<div>



</body>
</html>
';

print $html;
}
# sub new
# {
    # my $class = ref($_[0])||$_[0];
    # my $self ||={};
    # return bless $self,$class;
# }

# sub indexController
# {



# }


1;
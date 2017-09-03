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
   my($self,$html) = @_;
#   print "Content-type: text/html; charset=utf-8\n\n";

   print $html;
}


1;
package View::Main;

#user14
use strict;
use warnings;

sub new
{
    my $class = ref($_[0])||$_[0];
    my $self ||={};
    return bless $self,$class;
}

sub printMain{
   my($self,$html) = @_;

   print $html;
}


1;
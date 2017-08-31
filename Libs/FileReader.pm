package Libs::FileReader;

use strict;
use warnings;
use Data::Dumper;
sub new
{
    my $class = ref($_[0])||$_[0];
    my $self ||={};
    return bless $self,$class;
}

sub readFile
{
    my($self,$fileName) = @_;
     open my $fh,"< $fileName";
     binmode($fh);
     
     local $/;
     my $fileContent = <$fh>;
     
     
     return $fileContent;
}
    
    1;
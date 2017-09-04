package Libs::MakeHash;

#user14
use strict;
use warnings;

sub makeHash;

sub new
{
    my $class = ref($_[0])||$_[0];
    my $self ||={};
    return bless $self,$class;
}

sub makeHash
{
    my($self,$registe,$news,$profile,) = @_;
    my %c = (LANG_register=>$registe,LANG_allNews=>$news,LANG_portfolio=>$profile);
    return \%c;
}
    
    1;
package Libs::PlaceholderReplace;

#user14
use strict;
use warnings;

sub replacer;

sub new
{
    my $class = ref($_[0]) || $_[0];
    my $self ||= {};
    return bless $self, $class;
}

sub replacer
{
    my ($self, $replaceFile, $replaceHash) = @_;

    $replaceFile =~ s/(LANG_\w+)/$replaceHash->{$1}/gse;
    return $replaceFile;
}

1;
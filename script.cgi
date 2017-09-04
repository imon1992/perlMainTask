#!C:\Dwimperl\perl\bin\perl.exe -w

use strict;
use warnings;

use CGI qw(:cgi-lib :escapeHTML :unescapeHTML);
#use CGI::Carp qw(fatalsToBrowser);

use lib('Utils');
use lib('Rout');
use lib('View');
use lib('Libs');
use lib('Controller');

use Rout::Rout;

print "Content-type: text/html; charset=utf-8\n\n";

my $rout = Rout::Rout->new();
$rout->rout();


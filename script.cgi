#!/usr/bin/perl -w

use strict;
use warnings;
use Data::Dumper;
use CGI qw(:cgi-lib :escapeHTML :unescapeHTML);
use CGI::Carp qw(fatalsToBrowser);
 # print "Content-type: text/html; charset=utf-8\n\n";


use lib('Utils');
use lib('Rout');
use lib('View');
use lib('Libs');
# use lib('Controller');



use Rout::Rout;
#use Libs::Validators;
 use vars qw(%in);



 $|=1;
 ReadParse();


my $rout = Rout::Rout->new();
$rout->rout();

 print '<pre>' . Dumper(\%in).'<pre>';
# print '<pre>' . Dumper($in{login}).'<pre>';

 # print '<pre>' . Dumper(\%ENV).'<pre>';
# print $ENV{QUERY_STRING};

# my $fileReader = Utils::File->new();
# my $file = $fileReader->readFile('registerLogin.html');
# #print Dumper($file);

# my $fileHtml = $fileReader->readFile('main.html');
# my $sub = Utils::Substitutor->new();

# my $langs = $sub->makeHash('LANG_register',$file);

# #print Dumper($langs);
# my $parser = Utils::Parser->new();

# my $result = $parser->parser($fileHtml,$langs);

# print $result;

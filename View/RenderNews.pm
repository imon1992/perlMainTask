package View::RenderNews;

use strict;
use warnings;
use Data::Dumper;
sub new
{
    my $class = ref($_[0])||$_[0];
    my $self ||={};
    return bless $self,$class;
}

sub renderNews{
    my($self,$allNews) = @_;
# print "Content-type: text/html; charset=utf-8\n\n";
my $html ='';

# ';
foreach my $key(keys $allNews)
{
    # print Dumper($allNews->{$key}{'title'});
    $html .= '<div class="news">
        <div class="date">'.$allNews->{$key}->{date} .'</div>
        <div class="news"> <p>'.$allNews->{$key}->{title} .'</p>'.
            '<p>'.$allNews->{$key}->{text} .'</p>
        </div>
        <div class="author">'.$allNews->{$key}->{login} .'</div>
    </div>';
   # my $a = $d3{$key}; 
   # # print  $a->[0];
   # $html .= "<div> <p> $a->[0] </p>
                   # <p> $a->[1] </p>
                   # <p> $a->[2] </p>
             # </div>";
}



return $html;
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
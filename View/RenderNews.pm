package View::RenderNews;

#user14
use strict;
use warnings;

sub renderNews;

sub new
{
    my $class = ref($_[0]) || $_[0];
    my $self ||= {};
    return bless $self, $class;
}

sub renderNews {
    my ($self, $allNews) = @_;

    my $html = '';

    # ';
    foreach my $key(keys $allNews)
    {

        $html .= '<div class="news">
        <div class="date">'.$allNews->{$key}->{date} .'</div>
        <div class="news"> <p>'.$allNews->{$key}->{title} .'</p>'.
            '<p>'.$allNews->{$key}->{text} .'</p>
        </div>
        <div class="author">'.$allNews->{$key}->{login} .'</div>
    </div>';

    }

    return $html;
}


1;
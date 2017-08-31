 package View::RenderProfile;

 use strict;
 use warnings;
 use Data::Dumper;
 sub new
 {
     my $class = ref($_[0])||$_[0];
     my $self ||={};
     return bless $self,$class;
 }

 sub renderUserInfo{
     my($self,$userInfo,$userNews) = @_;
 # print "Content-type: text/html; charset=utf-8\n\n";
 my $html ='';

 # ';
 foreach my $key(keys $allNews)
 {
     # print Dumper($allNews->{$key}{'title'});
     $profile .= '<p>'. $userInfo->{$key}->{password}. '</p>'.
                 '<p>'.$userInfo->{$key}->{email} . '</p>'.
                '<p>'. $userInfo->{$key}->{first_name}.'</p>'.
                '<p>'.$userInfo->{$key}->{last_name}.'<p>'.
                '<p><a href="'.$userInfo->{$key}->{id}.'> Change Info </a>';

 }

 foreach my $key(keys $userNews)
 {
     # print Dumper($allNews->{$key}{'title'});
     $news .= '<div class="news">
         <div class="date">'.$userNews->{$key}->{date} .'</div>
         <div class="news"> <p>'.$userNews->{$key}->{title} .'</p>'.
             '<p>'.$userNews->{$key}->{text} .'</p>
         </div>
         <div class="author">'.$userNews->{$key}->{login} .'</div>
        <a href="script.cgi?changeNews?userid='.$userNews->{$key}->{id}.'"> change New</a>
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


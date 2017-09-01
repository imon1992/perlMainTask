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

 my $profileInfo='';
 my $userNewsInfo = '';
 foreach my $key(keys $userInfo)
 {
     $profileInfo .=
                 '<p>'.$userInfo->{$key}->{email} . '</p>'.
                '<p>'. $userInfo->{$key}->{first_name}.'</p>'.
                '<p>'.$userInfo->{$key}->{last_name}.'<p>'.
                '<p><a href="script.cgi?changeProfile&id='.$userInfo->{$key}->{id}.'"> Change Info </a>';

 }

foreach my $key(keys $userNews)
{
# print $key1;
     # print Dumper($allNews->{$key}{'title'});
  $profileInfo.= ' <div >'.$userNews->{$key}->{date} .'</div>
                               <div class="news"> <p>'.$userNews->{$key}->{title} .'</p>'.
                                   '<p>'.$userNews->{$key}->{text} .'</p>
                               </div>
                               <a href="script.cgi?changeNews?id='.$userNews->{$key}->{id}.'"> change New</a>
                           </div>';
#    my $a = $d3{$key};
    # # print  $a->[0];
    # $html .= "<div> <p> $a->[0] </p>
                    # <p> $a->[1] </p>
                    # <p> $a->[2] </p>
              # </div>";
}

#my %profile =();
#$profile{LANG_profile} = $profileInfo;
#$profile{LANG_userNews} = $userNewsInfo;

#print Dumper(%profile);

return $profileInfo;
}

1;


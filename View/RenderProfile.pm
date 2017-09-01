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


 my $profileInfo='<p><a href="script.cgi?addNews=1&userid='.$userInfo->{0}->{id}.'">Add news</a></p>';

 foreach my $key(keys $userInfo)
 {

     $profileInfo .=
                  '<p> Email: '.$userInfo->{$key}->{email} . '</p>'.
                '<p>First Name: '. $userInfo->{$key}->{first_name}.'</p>'.
                '<p>Last Name: '.$userInfo->{$key}->{last_name}.'<p>'.
                '<p><a href="script.cgi?changeProfile=1&userid='.$userInfo->{$key}->{id}.'"> Change Info </a>';

 }

foreach my $key(keys $userNews)
{

  $profileInfo.= ' <div >'.$userNews->{$key}->{date} .'</div>
                               <div class="news"> <p>'.$userNews->{$key}->{title} .'</p>'.
                                   '<p>'.$userNews->{$key}->{text} .'</p>
                               </div>
                               <a href="script.cgi?changeNews=1&newsid='.$userNews->{$key}->{id}.'"> change New</a>
                           </div>';

}

return $profileInfo;
}

1;


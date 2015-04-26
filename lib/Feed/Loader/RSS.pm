package Feed::Loader::RSS;
use strict;
use warnings;

use parent qw/Feed::Loader/;

use LWP::UserAgent;

sub load {
    my ($class, $url) = @_;

    my $ua = LWP::UserAgent->new;
    my $res = $ua->get( $url );

    if ( !$res->is_success ) {
        die "Failed load rss : " . $res->status_line;
    }

    return $res->content;
}

1;

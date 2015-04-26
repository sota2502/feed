package Feed::Dumper::Stdout;
use strict;
use warnings;

use parent qw/Feed::Dumper/;

sub dump {
    my ($class, $content) = @_;

    print $content;
}

1;

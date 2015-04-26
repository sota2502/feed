package Feed::Dumper::File;
use strict;
use warnings;

use parent qw/Feed::Dumper/;

sub destination {
    shift->{destination};
}

sub dump {
    my ($class, $content) = @_;

    open my $fh, '>', $class->destination;
    print $fh $content;
    close $fh;
}

1;

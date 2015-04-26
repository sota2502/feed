use strict;
use warnings;

use Test::More;
use Capture::Tiny qw/capture/;

BEGIN {
    ::use_ok('Feed::Dumper::Stdout');
}

::subtest 'dump' => sub {
    my $data = 'This is test string.';
    my $dumper = Feed::Dumper::Stdout->new;
    my ($stdout) = capture {
        $dumper->dump( $data );
    };

    ::is( $stdout, $data );
};


::done_testing;

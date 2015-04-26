use strict;
use warnings;

use Test::More;
use File::Temp qw/tempfile/;

BEGIN {
    ::use_ok('Feed::Dumper::File');
}

::subtest 'dump' => sub {
    my (undef, $file) = tempfile(undef, OPEN => 0);

    my $data = 'This is test string.';
    my $dumper = Feed::Dumper::File->new({destination => $file});
    $dumper->dump( $data );

    open my $fh, '<', $file;
    my $res = do { local $/; <$fh> };
    close $fh;

    ::is $res, $data;
};


::done_testing;

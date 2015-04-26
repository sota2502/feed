use strict;
use warnings;

use Test::More;

BEGIN {
    ::use_ok('Feed::Converter::NewsPicksRemover');
}

::subtest 'convert' => sub {
    my $input = 'NNNNewsPickssss';
    my $converter = Feed::Converter::NewsPicksRemover->new;
    my $ret = $converter->convert($input);
    ::is( $ret, 'NNNsss' );
};

::done_testing;

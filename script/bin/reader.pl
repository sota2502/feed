use strict;
use warnings;

use Feed;

Feed->execute(
    Loader    => 'RSS',
    Converter => 'NewsPicksRemover',
    Dumper    => 'Stdout',
    inputs    => [qw(
        http://tech.uzabase.com/rss
    )],
);

Feed->execute(
    Loader    => 'RSS',
    Converter => 'NewsPicksRemover',
    Dumper    => [ File => { destination => 'result.txt' } ],
    inputs    => [qw(
        http://tech.uzabase.com/rss
    )],
);

package Feed::Converter::NewsPicksRemover;
use strict;
use warnings;

use parent qw/Feed::Converter/;

sub convert {
    my ($class, $content) = @_;

    $content =~ s/NewsPicks//g;

    return $content;
}

1;

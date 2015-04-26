package Feed::Loader;
use strict;
use warnings;

sub new {
    my ($class, $args) = @_;

    my $self = $args || {};
    return bless $self, $class;
}

sub load {
    die 'override me';
}

1;

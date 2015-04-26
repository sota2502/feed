package Feed::Converter;
use strict;
use warnings;

sub new {
    my ($class, $args) = @_;

    my $self = $args || {};
    return bless $self, $class;
}

sub convert {
    die 'override me';
}

1;

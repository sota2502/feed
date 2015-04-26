package Feed::Dumper;
use strict;
use warnings;

sub new {
    my ($class, $args) = @_;

    my $self = $args || {};
    return bless $self, $class;
}

sub dump {
    die 'override me';
}

1;

package Feed;
use strict;
use warnings;

use UNIVERSAL::require;

sub __load_module {
    my ($prefix, $sig) = @_;

    my $module = join '::', 'Feed', $prefix, $sig;
    $module->require || die "Failed to load $module";

    return $module;
}

sub execute {
    my ($class, %args) = @_;

    my ($loader, $converter, $dumper) = map {
        my ($module_name, $module_args) = ref $args{$_} eq 'ARRAY'
            ? @{ $args{$_} }
            : ($args{$_});
        my $module = __load_module($_, $module_name );
        $module->new( $module_args );
    } qw/Loader Converter Dumper/;

    foreach my $input (@{ $args{inputs} }) {
        my $content   = $loader->load($input);
        my $converted = eval { $converter->convert($content) };
        if ( $@ ) {
            warn "Failed convert $input : $@";
        }
        $dumper->dump( $converted );
    }
}

1;

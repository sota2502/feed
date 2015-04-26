use strict;
use warnings;

use Test::More;
use Test::MockObject;

BEGIN {
    ::use_ok('Feed::Loader::RSS');
}

my $dummy_content = <<EOT
<?xml version="1.0"?>
<rss version="2.0">
<channel>
</channel>
</rss>
EOT
;

my $mock_response = Test::MockObject->new;
$mock_response->fake_new( 'HTTP::Response' );
$mock_response->mock( is_success => sub { 1 } );
$mock_response->mock( content => sub { $dummy_content } );

Test::MockObject->fake_module(
    'LWP::UserAgent',
    new => sub { shift },
    get => sub { $mock_response },
);

::subtest 'load' => sub {
    my $loader = Feed::Loader::RSS->new;
    my $ret = $loader->load('http://example.com/');
    ::is $ret, $dummy_content; 
};


::done_testing;

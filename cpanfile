requires 'LWP::UserAgent';
requires 'UNIVERSAL::require';

on 'test' => sub {
    requires 'Test::More';
    requires 'Test::MockObject';
    requires 'Capture::Tiny';
    requires 'File::Temp';
};

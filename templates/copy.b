#!/usr/bin/perl

use Benchmark ':all';

open my $fh, 'www.cpan.org.html';
undef $/;
my $html = <$fh>;

my $r = timethese ($ARGV[0] || -1, { $0 => sub {

    my $h = $html;

} } );

cmpthese $r, 'all';

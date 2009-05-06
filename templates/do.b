#!/usr/bin/perl

use Benchmark ':all';

my $r = timethese ($ARGV[0] || -1, { $0 => sub {

    my $html = do 'heredoc.pl';

} } );

cmpthese $r, 'all';

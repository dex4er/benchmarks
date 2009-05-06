#!/usr/bin/perl

use Benchmark ':all';

use HTML::Template::Compiled speed => 1;

my $htc = HTML::Template::Compiled->new(filename => 'www.cpan.org.html');

my $r = timethese ($ARGV[0] || -1, { $0 => sub {

    my $h = $htc->output;

} } );

cmpthese $r, 'all';

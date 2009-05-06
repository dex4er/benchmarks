#!/usr/bin/perl

use Benchmark ':all';

use HTML::Template;

my $ht = HTML::Template->new(filename => 'www.cpan.org.html');

my $r = timethese ($ARGV[0] || -1, { $0 => sub {

    my $h = $ht->output;

} } );

cmpthese $r, 'all';

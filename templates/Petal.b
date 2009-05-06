#!/usr/bin/perl

use Benchmark ':all';

use Petal;

my $t = Petal->new(
    file         => 'www.cpan.org_petal.html',
    memory_cache => 1,
);

my $r = timethese ($ARGV[0] || -1, { $0 => sub {

    $t->process;

} } );

cmpthese $r, 'all';

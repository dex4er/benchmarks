#!/usr/bin/perl

use Test::More tests => 1;
use Test::Differences;

use Perl6::Slurp;

my $a = slurp 'www.cpan.org.html';
my $b = do 'heredoc.pl';

eq_or_diff $b, $a;


use Benchmark ':all';

my $r = timethese ($ARGV[0] || -1, { $0 => sub {

    my $html = do 'heredoc.pl';

} }, 'none' );
my $s = cmpthese $r, 'none';
diag($s->[1][1]);

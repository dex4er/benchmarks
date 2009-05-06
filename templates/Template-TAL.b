#!/usr/bin/perl

use Benchmark ':all';

use Template::TAL;

open my $fh, 'www.cpan.org.html';
undef $/;
my $html = <$fh>;

my $t = Template::TAL->new;

my $r = timethese ($ARGV[0] || -1, { $0 => sub {

    print $t->process(\$html, {});

} } );

cmpthese $r, 'all';

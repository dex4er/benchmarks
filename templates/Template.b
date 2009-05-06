#!/usr/bin/perl

use Benchmark ':all';

use Template;

open my $fh, 'www.cpan.org.html';
undef $/;
my $html = <$fh>;

my $t = Template->new;

my $r = timethese ($ARGV[0] || -1, { $0 => sub {

    $t->process(\$html, {}, \$h);

} } );

cmpthese $r, 'all';

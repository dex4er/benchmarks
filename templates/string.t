#!/usr/bin/perl

use Test::More tests => 1;
use Test::Differences;

use Perl6::Slurp;

use Benchmark ':all';

my $a = slurp 'www.cpan.org.html';
my $b = # this is one long string
        '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"' . "\n" .
        '   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">' . "\n" .
        '<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en-US">' . "\n" .
        '<head>' . "\n" .
        '<title>CPAN</title>' . "\n" .
        '<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"/>' . "\n" .
        '<!-- Copyright Jarkko Hietaniemi <jhi@iki.fi>' . "\n" .
        '     1998,1999,2000,2001,2003,2003,2004,2005,2008' . "\n" .
        '     All Rights Reserved.' . "\n" .
        '     The CPAN Logo provided by J.C. Thorpe.' . "\n" .
        '     You may distribute this document either under the Artistic License' . "\n" .
        '     (comes with Perl) or the GNU Public License, whichever suits you.' . "\n" .
        '' . "\n" .
        '     LEGALESE' . "\n" .
        '' . "\n" .
        '     You are not allowed to remove or alter these comments.' . "\n" .
        '' . "\n" .
        '     You are not allowed to rename, remove, or add any files' . "\n" .
        '     in your public mirror of CPAN.' . "\n" .
        '' . "\n" .
        '     "Public mirror of CPAN" means a site listed in' . "\n" .
        '     the SITES.html and SITES files at the top level of CPAN' . "\n" .
        '     and also listed at the site http://mirrors.cpan.org/.' . "\n" .
        '' . "\n" .
        '     You are not allowed to alter any file' . "\n" .
        '     in you public mirror of CPAN' . "\n" .
        '     EXCEPT' . "\n" .
        '     that you can add a short acknowledgement for example' . "\n" .
        '     for your hosting company, company, university, or sponsor,' . "\n" .
        '     into this CPAN top-level index.html by adding a small' . "\n" .
        '     non-animated image and a hyperlink pointing to your organization' . "\n" .
        '     with text like "hosted by", "powered by", or "sponsored by",' . "\n" .
        '     by placing it visually next to the "CPAN master site hosted by FUNET"' . "\n" .
        '     acknowledgement at the bottom of the page.' . "\n" .
        '     The image used may not be larger than the one used for the FUNET logo.' . "\n" .
        '         (Technical sidenote: if you do add an acknowledgement link,' . "\n" .
        '         please do think of the consequences to your possible downstream' . "\n" .
        '         CPAN mirrors.)' . "\n" .
        '     Altering this index.html in any other way is not allowed.' . "\n" .
        '     Altering any other files is not allowed.' . "\n" .
        '' . "\n" .
        '     Adding any advertisements or any revenue-generating material' . "\n" .
        '     is strictly forbidden.' . "\n" .
        '' . "\n" .
        '     Similarly, for your public CPAN mirrors "framing" or "wrapping"' . "\n" .
        '     the CPAN web pages into other sites by using e.g. HTML tables' . "\n" .
        '     or frames is not allowed.' . "\n" .
        '' . "\n" .
        '     You are allowed to use the files of CPAN to create your own' . "\n" .
        '     web sites and services since we are just a distributor of the files,' . "\n" .
        '     we do not own most of them.  However, you may not call your creations' . "\n" .
        '     "CPAN" or "CPAN mirrors".  You may say that the files are "mirrored' . "\n" .
        '     from CPAN".' . "\n" .
        '' . "\n" .
        '-->' . "\n" .
        '<!-- $Id: index.html,v 1.76 2008/10/25 20:04:53 jhi Exp $ -->' . "\n" .
        '<link rev="made" href="mailto:cpan@perl.org"></link>' . "\n" .
        '<style type="text/css">' . "\n" .
        '<!--' . "\n" .
        '' . "\n" .
        'body{' . "\n" .
        '  color:black;' . "\n" .
        '  background:white;' . "\n" .
        '  margin-left:2%;' . "\n" .
        '  margin-right:2%;' . "\n" .
        '}' . "\n" .
        '' . "\n" .
        'h1{' . "\n" .
        '  text-align:center;' . "\n" .
        '}' . "\n" .
        '' . "\n" .
        'img     {' . "\n" .
        '  vertical-align:        50%;' . "\n" .
        '  border:       0;' . "\n" .
        '}' . "\n" .
        '' . "\n" .
        '.left{' . "\n" .
        '  text-align:left;' . "\n" .
        '  float:none;' . "\n" .
        '}' . "\n" .
        '' . "\n" .
        '.center{' . "\n" .
        '  text-align:center;' . "\n" .
        '  float:none;' . "\n" .
        '}' . "\n" .
        '' . "\n" .
        '.right{' . "\n" .
        '  text-align:right;' . "\n" .
        '  float:none;' . "\n" .
        '}' . "\n" .
        '' . "\n" .
        '-->' . "\n" .
        '</style>' . "\n" .
        '</head>' . "\n" .
        '<body>' . "\n" .
        '' . "\n" .
        '<table width="100%">' . "\n" .
        ' <tr>' . "\n" .
        '  <td rowspan="2">' . "\n" .
        '   <div class="left">' . "\n" .
        '    <img src="misc/jpg/cpan.jpg"' . "\n" .
        '         alt="[CPAN Logo]" height="77" width="250"/>' . "\n" .
        '   </div>' . "\n" .
        '  </td>' . "\n" .
        '  <td>' . "\n" .
        '   <div class="right">' . "\n" .
        '    <h1><a id="top">Comprehensive Perl Archive Network</a></h1>' . "\n" .
        '   </div>' . "\n" .
        '  </td>' . "\n" .
        ' </tr>' . "\n" .
        ' <tr>' . "\n" .
        '  <td>' . "\n" .
        '    <div class="center">' . "\n" .
        '    2009-05-06 online since 1995-10-26<br/>5536 MB 206 mirrors<br/>7349 authors 15693 modules' . "\n" .
        '    </div>' . "\n" .
        '  </td>' . "\n" .
        ' </tr>' . "\n" .
        ' <tr>' . "\n" .
        '  <td colspan="2">' . "\n" .
        '   <p class="left">' . "\n" .
        'Welcome to CPAN!' . "\n" .
        'Here you will find All Things Perl.' . "\n" .
        '   </p>' . "\n" .
        '  </td>' . "\n" .
        '  <td>' . "\n" .
        '  </td>' . "\n" .
        ' </tr>' . "\n" .
        '</table>' . "\n" .
        '' . "\n" .
        '<hr/>' . "\n" .
        '' . "\n" .
        '<table width="100%">' . "\n" .
        '' . "\n" .
        '<tr>' . "\n" .
        '' . "\n" .
        '<td>' . "\n" .
        '' . "\n" .
        '<h1>Browsing</h1>' . "\n" .
        '<ul>' . "\n" .
        '  <li><a href="modules/index.html">Perl modules</a></li>' . "\n" .
        '  <li><a href="scripts/index.html">Perl scripts</a></li>' . "\n" .
        '  <li><a href="ports/index.html">Perl binary distributions ("ports")</a></li>' . "\n" .
        '  <li><a href="src/README.html">Perl source code</a></li>' . "\n" .
        '  <li><a href="RECENT.html">Perl recent arrivals</a></li>' . "\n" .
        '  <li><a href="http://search.cpan.org/recent">recent</a> Perl modules</li>' . "\n" .
        '  <li><a href="SITES.html">CPAN sites</a> list</li>' . "\n" .
        '  <li><a href="http://mirrors.cpan.org/">CPAN sites</a> map</li>' . "\n" .
        '</ul>' . "\n" .
        '' . "\n" .
        '</td>' . "\n" .
        '' . "\n" .
        '<td>' . "\n" .
        '' . "\n" .
        '<h1>Searching</h1>' . "\n" .
        '' . "\n" .
        '<ul>' . "\n" .
        '<li><a href="http://perldoc.perl.org/">Perl core documentation</a> (perldoc.perl.org; Jon Allen)</li>' . "\n" .
        '<li><a href="http://kobesearch.cpan.org/">Perl core and CPAN modules documentation </a> (Randy Kobes)</li>' . "\n" .
        '<li><a href="http://search.cpan.org/">CPAN modules, distributions, and authors</a> (search.cpan.org)</li>' . "\n" .
        '<!-- a href="http://wait.cpan.org/">CPAN modules documentation</a> (Ulrich Pfeifer) -->' . "\n" .
        '</ul>' . "\n" .
        '' . "\n" .
        '<h1>FAQ etc</h1>' . "\n" .
        '' . "\n" .
        '<ul>' . "\n" .
        '<li><a href="misc/cpan-faq.html">CPAN Frequently Asked Questions</a></li>' . "\n" .
        '<li><a href="http://faq.perl.org/">Perl FAQ</a></li>' . "\n" .
        '<li><a href="http://lists.cpan.org/">Perl Mailing Lists</a></li>' . "\n" .
        '<li><a href="http://bookmarks.cpan.org/">Perl Bookmarks</a></li>' . "\n" .
        '</ul>' . "\n" .
        '' . "\n" .
        '<p><small>' . "\n" .
        'Yours Eclectically, The Self-Appointed Master Librarian (OOK!) of the CPAN<br/>' . "\n" .
        '<i>Jarkko Hietaniemi</i>' . "\n" .
        '<a href="mailto:cpan@perl.org">cpan@perl.org</a>' . "\n" .
        '<a href="disclaimer.html">[Disclaimer]</a>' . "\n" .
        '2001-04-01' . "\n" .
        '</small>' . "\n" .
        '</p>' . "\n" .
        '' . "\n" .
        '</td>' . "\n" .
        '' . "\n" .
        '</tr>' . "\n" .
        '' . "\n" .
        '</table>' . "\n" .
        '' . "\n" .
        '<hr/>' . "\n" .
        '' . "\n" .
        '<table width="100%">' . "\n" .
        '<tr>' . "\n" .
        '' . "\n" .
        '<td>' . "\n" .
        '<div class="left">' . "\n" .
        '<a href="http://validator.w3.org/check?uri=http%3A%2F%2Fwww.cpan.org%2Findex.html">' . "\n" .
        '<img src="misc/gif/valid-xhtml10.gif" alt="Valid XHTML 1.0!" height="31" width="88"/></a>' . "\n" .
        '<a href="http://jigsaw.w3.org/css-validator/validator?uri=http%3A%2F%2Fwww.cpan.org%2Findex.html"><img src="misc/gif/vcss.gif" alt="[Valid CSS]" height="31" width="88"/></a>' . "\n" .
        '</div>' . "\n" .
        '</td>' . "\n" .
        '<td>' . "\n" .
        '<div class="right">' . "\n" .
        '' . "\n" .
        '<table width="100%">' . "\n" .
        '' . "\n" .
        '<tr>' . "\n" .
        '<td class="right">' . "\n" .
        '<small>' . "\n" .
        'CPAN master site hosted by' . "\n" .
        '</small>' . "\n" .
        '</td>' . "\n" .
        '</tr>' . "\n" .
        '<tr>' . "\n" .
        '<td class="right">' . "\n" .
        '<a href="http://www.csc.fi/english/institutions/funet_en/about"><img src="misc/gif/funet.gif" alt="FUNET" height="25" width="88"/></a>' . "\n" .
        '</td>' . "\n" .
        '</tr>' . "\n" .
        '</table>' . "\n" .
        '' . "\n" .
        '</div>' . "\n" .
        '</td>' . "\n" .
        '' . "\n" .
        '</tr>' . "\n" .
        '</table>' . "\n" .
        '' . "\n" .
        '</body>' . "\n" .
        '</html>' . "\n";

eq_or_diff $b, $a;


use Benchmark ':all';

my $r = timethese ($ARGV[0] || -1, { $0 => sub {

    my $html = 
        '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"' . "\n" .
        '   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">' . "\n" .
        '<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en-US">' . "\n" .
        '<head>' . "\n" .
        '<title>CPAN</title>' . "\n" .
        '<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"/>' . "\n" .
        '<!-- Copyright Jarkko Hietaniemi <jhi@iki.fi>' . "\n" .
        '     1998,1999,2000,2001,2003,2003,2004,2005,2008' . "\n" .
        '     All Rights Reserved.' . "\n" .
        '     The CPAN Logo provided by J.C. Thorpe.' . "\n" .
        '     You may distribute this document either under the Artistic License' . "\n" .
        '     (comes with Perl) or the GNU Public License, whichever suits you.' . "\n" .
        '' . "\n" .
        '     LEGALESE' . "\n" .
        '' . "\n" .
        '     You are not allowed to remove or alter these comments.' . "\n" .
        '' . "\n" .
        '     You are not allowed to rename, remove, or add any files' . "\n" .
        '     in your public mirror of CPAN.' . "\n" .
        '' . "\n" .
        '     "Public mirror of CPAN" means a site listed in' . "\n" .
        '     the SITES.html and SITES files at the top level of CPAN' . "\n" .
        '     and also listed at the site http://mirrors.cpan.org/.' . "\n" .
        '' . "\n" .
        '     You are not allowed to alter any file' . "\n" .
        '     in you public mirror of CPAN' . "\n" .
        '     EXCEPT' . "\n" .
        '     that you can add a short acknowledgement for example' . "\n" .
        '     for your hosting company, company, university, or sponsor,' . "\n" .
        '     into this CPAN top-level index.html by adding a small' . "\n" .
        '     non-animated image and a hyperlink pointing to your organization' . "\n" .
        '     with text like "hosted by", "powered by", or "sponsored by",' . "\n" .
        '     by placing it visually next to the "CPAN master site hosted by FUNET"' . "\n" .
        '     acknowledgement at the bottom of the page.' . "\n" .
        '     The image used may not be larger than the one used for the FUNET logo.' . "\n" .
        '         (Technical sidenote: if you do add an acknowledgement link,' . "\n" .
        '         please do think of the consequences to your possible downstream' . "\n" .
        '         CPAN mirrors.)' . "\n" .
        '     Altering this index.html in any other way is not allowed.' . "\n" .
        '     Altering any other files is not allowed.' . "\n" .
        '' . "\n" .
        '     Adding any advertisements or any revenue-generating material' . "\n" .
        '     is strictly forbidden.' . "\n" .
        '' . "\n" .
        '     Similarly, for your public CPAN mirrors "framing" or "wrapping"' . "\n" .
        '     the CPAN web pages into other sites by using e.g. HTML tables' . "\n" .
        '     or frames is not allowed.' . "\n" .
        '' . "\n" .
        '     You are allowed to use the files of CPAN to create your own' . "\n" .
        '     web sites and services since we are just a distributor of the files,' . "\n" .
        '     we do not own most of them.  However, you may not call your creations' . "\n" .
        '     "CPAN" or "CPAN mirrors".  You may say that the files are "mirrored' . "\n" .
        '     from CPAN".' . "\n" .
        '' . "\n" .
        '-->' . "\n" .
        '<!-- $Id: index.html,v 1.76 2008/10/25 20:04:53 jhi Exp $ -->' . "\n" .
        '<link rev="made" href="mailto:cpan@perl.org"></link>' . "\n" .
        '<style type="text/css">' . "\n" .
        '<!--' . "\n" .
        '' . "\n" .
        'body{' . "\n" .
        '  color:black;' . "\n" .
        '  background:white;' . "\n" .
        '  margin-left:2%;' . "\n" .
        '  margin-right:2%;' . "\n" .
        '}' . "\n" .
        '' . "\n" .
        'h1{' . "\n" .
        '  text-align:center;' . "\n" .
        '}' . "\n" .
        '' . "\n" .
        'img     {' . "\n" .
        '  vertical-align:        50%;' . "\n" .
        '  border:       0;' . "\n" .
        '}' . "\n" .
        '' . "\n" .
        '.left{' . "\n" .
        '  text-align:left;' . "\n" .
        '  float:none;' . "\n" .
        '}' . "\n" .
        '' . "\n" .
        '.center{' . "\n" .
        '  text-align:center;' . "\n" .
        '  float:none;' . "\n" .
        '}' . "\n" .
        '' . "\n" .
        '.right{' . "\n" .
        '  text-align:right;' . "\n" .
        '  float:none;' . "\n" .
        '}' . "\n" .
        '' . "\n" .
        '-->' . "\n" .
        '</style>' . "\n" .
        '</head>' . "\n" .
        '<body>' . "\n" .
        '' . "\n" .
        '<table width="100%">' . "\n" .
        ' <tr>' . "\n" .
        '  <td rowspan="2">' . "\n" .
        '   <div class="left">' . "\n" .
        '    <img src="misc/jpg/cpan.jpg"' . "\n" .
        '         alt="[CPAN Logo]" height="77" width="250"/>' . "\n" .
        '   </div>' . "\n" .
        '  </td>' . "\n" .
        '  <td>' . "\n" .
        '   <div class="right">' . "\n" .
        '    <h1><a id="top">Comprehensive Perl Archive Network</a></h1>' . "\n" .
        '   </div>' . "\n" .
        '  </td>' . "\n" .
        ' </tr>' . "\n" .
        ' <tr>' . "\n" .
        '  <td>' . "\n" .
        '    <div class="center">' . "\n" .
        '    2009-05-06 online since 1995-10-26<br/>5536 MB 206 mirrors<br/>7349 authors 15693 modules' . "\n" .
        '    </div>' . "\n" .
        '  </td>' . "\n" .
        ' </tr>' . "\n" .
        ' <tr>' . "\n" .
        '  <td colspan="2">' . "\n" .
        '   <p class="left">' . "\n" .
        'Welcome to CPAN!' . "\n" .
        'Here you will find All Things Perl.' . "\n" .
        '   </p>' . "\n" .
        '  </td>' . "\n" .
        '  <td>' . "\n" .
        '  </td>' . "\n" .
        ' </tr>' . "\n" .
        '</table>' . "\n" .
        '' . "\n" .
        '<hr/>' . "\n" .
        '' . "\n" .
        '<table width="100%">' . "\n" .
        '' . "\n" .
        '<tr>' . "\n" .
        '' . "\n" .
        '<td>' . "\n" .
        '' . "\n" .
        '<h1>Browsing</h1>' . "\n" .
        '<ul>' . "\n" .
        '  <li><a href="modules/index.html">Perl modules</a></li>' . "\n" .
        '  <li><a href="scripts/index.html">Perl scripts</a></li>' . "\n" .
        '  <li><a href="ports/index.html">Perl binary distributions ("ports")</a></li>' . "\n" .
        '  <li><a href="src/README.html">Perl source code</a></li>' . "\n" .
        '  <li><a href="RECENT.html">Perl recent arrivals</a></li>' . "\n" .
        '  <li><a href="http://search.cpan.org/recent">recent</a> Perl modules</li>' . "\n" .
        '  <li><a href="SITES.html">CPAN sites</a> list</li>' . "\n" .
        '  <li><a href="http://mirrors.cpan.org/">CPAN sites</a> map</li>' . "\n" .
        '</ul>' . "\n" .
        '' . "\n" .
        '</td>' . "\n" .
        '' . "\n" .
        '<td>' . "\n" .
        '' . "\n" .
        '<h1>Searching</h1>' . "\n" .
        '' . "\n" .
        '<ul>' . "\n" .
        '<li><a href="http://perldoc.perl.org/">Perl core documentation</a> (perldoc.perl.org; Jon Allen)</li>' . "\n" .
        '<li><a href="http://kobesearch.cpan.org/">Perl core and CPAN modules documentation </a> (Randy Kobes)</li>' . "\n" .
        '<li><a href="http://search.cpan.org/">CPAN modules, distributions, and authors</a> (search.cpan.org)</li>' . "\n" .
        '<!-- a href="http://wait.cpan.org/">CPAN modules documentation</a> (Ulrich Pfeifer) -->' . "\n" .
        '</ul>' . "\n" .
        '' . "\n" .
        '<h1>FAQ etc</h1>' . "\n" .
        '' . "\n" .
        '<ul>' . "\n" .
        '<li><a href="misc/cpan-faq.html">CPAN Frequently Asked Questions</a></li>' . "\n" .
        '<li><a href="http://faq.perl.org/">Perl FAQ</a></li>' . "\n" .
        '<li><a href="http://lists.cpan.org/">Perl Mailing Lists</a></li>' . "\n" .
        '<li><a href="http://bookmarks.cpan.org/">Perl Bookmarks</a></li>' . "\n" .
        '</ul>' . "\n" .
        '' . "\n" .
        '<p><small>' . "\n" .
        'Yours Eclectically, The Self-Appointed Master Librarian (OOK!) of the CPAN<br/>' . "\n" .
        '<i>Jarkko Hietaniemi</i>' . "\n" .
        '<a href="mailto:cpan@perl.org">cpan@perl.org</a>' . "\n" .
        '<a href="disclaimer.html">[Disclaimer]</a>' . "\n" .
        '2001-04-01' . "\n" .
        '</small>' . "\n" .
        '</p>' . "\n" .
        '' . "\n" .
        '</td>' . "\n" .
        '' . "\n" .
        '</tr>' . "\n" .
        '' . "\n" .
        '</table>' . "\n" .
        '' . "\n" .
        '<hr/>' . "\n" .
        '' . "\n" .
        '<table width="100%">' . "\n" .
        '<tr>' . "\n" .
        '' . "\n" .
        '<td>' . "\n" .
        '<div class="left">' . "\n" .
        '<a href="http://validator.w3.org/check?uri=http%3A%2F%2Fwww.cpan.org%2Findex.html">' . "\n" .
        '<img src="misc/gif/valid-xhtml10.gif" alt="Valid XHTML 1.0!" height="31" width="88"/></a>' . "\n" .
        '<a href="http://jigsaw.w3.org/css-validator/validator?uri=http%3A%2F%2Fwww.cpan.org%2Findex.html"><img src="misc/gif/vcss.gif" alt="[Valid CSS]" height="31" width="88"/></a>' . "\n" .
        '</div>' . "\n" .
        '</td>' . "\n" .
        '<td>' . "\n" .
        '<div class="right">' . "\n" .
        '' . "\n" .
        '<table width="100%">' . "\n" .
        '' . "\n" .
        '<tr>' . "\n" .
        '<td class="right">' . "\n" .
        '<small>' . "\n" .
        'CPAN master site hosted by' . "\n" .
        '</small>' . "\n" .
        '</td>' . "\n" .
        '</tr>' . "\n" .
        '<tr>' . "\n" .
        '<td class="right">' . "\n" .
        '<a href="http://www.csc.fi/english/institutions/funet_en/about"><img src="misc/gif/funet.gif" alt="FUNET" height="25" width="88"/></a>' . "\n" .
        '</td>' . "\n" .
        '</tr>' . "\n" .
        '</table>' . "\n" .
        '' . "\n" .
        '</div>' . "\n" .
        '</td>' . "\n" .
        '' . "\n" .
        '</tr>' . "\n" .
        '</table>' . "\n" .
        '' . "\n" .
        '</body>' . "\n" .
        '</html>' . "\n";

} }, 'none' );
my $s = cmpthese $r, 'none';
diag($s->[1][1]);

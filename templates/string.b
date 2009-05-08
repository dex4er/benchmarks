#!/usr/bin/perl

use Benchmark ':all';

my $eol = "\n";

my $r = timethese ($ARGV[0] || -1, { $0 => sub {

    my $html = 
        '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"' . $eol .
        '   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">' . $eol .
        '<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en-US">' . $eol .
        '<head>' . $eol .
        '<title>CPAN</title>' . $eol .
        '<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"/>' . $eol .
        '<!-- Copyright Jarkko Hietaniemi <jhi@iki.fi>' . $eol .
        '     1998,1999,2000,2001,2003,2003,2004,2005,2008' . $eol .
        '     All Rights Reserved.' . $eol .
        '     The CPAN Logo provided by J.C. Thorpe.' . $eol .
        '     You may distribute this document either under the Artistic License' . $eol .
        '     (comes with Perl) or the GNU Public License, whichever suits you.' . $eol .
        '' . $eol .
        '     LEGALESE' . $eol .
        '' . $eol .
        '     You are not allowed to remove or alter these comments.' . $eol .
        '' . $eol .
        '     You are not allowed to rename, remove, or add any files' . $eol .
        '     in your public mirror of CPAN.' . $eol .
        '' . $eol .
        '     "Public mirror of CPAN" means a site listed in' . $eol .
        '     the SITES.html and SITES files at the top level of CPAN' . $eol .
        '     and also listed at the site http://mirrors.cpan.org/.' . $eol .
        '' . $eol .
        '     You are not allowed to alter any file' . $eol .
        '     in you public mirror of CPAN' . $eol .
        '     EXCEPT' . $eol .
        '     that you can add a short acknowledgement for example' . $eol .
        '     for your hosting company, company, university, or sponsor,' . $eol .
        '     into this CPAN top-level index.html by adding a small' . $eol .
        '     non-animated image and a hyperlink pointing to your organization' . $eol .
        '     with text like "hosted by", "powered by", or "sponsored by",' . $eol .
        '     by placing it visually next to the "CPAN master site hosted by FUNET"' . $eol .
        '     acknowledgement at the bottom of the page.' . $eol .
        '     The image used may not be larger than the one used for the FUNET logo.' . $eol .
        '         (Technical sidenote: if you do add an acknowledgement link,' . $eol .
        '         please do think of the consequences to your possible downstream' . $eol .
        '         CPAN mirrors.)' . $eol .
        '     Altering this index.html in any other way is not allowed.' . $eol .
        '     Altering any other files is not allowed.' . $eol .
        '' . $eol .
        '     Adding any advertisements or any revenue-generating material' . $eol .
        '     is strictly forbidden.' . $eol .
        '' . $eol .
        '     Similarly, for your public CPAN mirrors "framing" or "wrapping"' . $eol .
        '     the CPAN web pages into other sites by using e.g. HTML tables' . $eol .
        '     or frames is not allowed.' . $eol .
        '' . $eol .
        '     You are allowed to use the files of CPAN to create your own' . $eol .
        '     web sites and services since we are just a distributor of the files,' . $eol .
        '     we do not own most of them.  However, you may not call your creations' . $eol .
        '     "CPAN" or "CPAN mirrors".  You may say that the files are "mirrored' . $eol .
        '     from CPAN".' . $eol .
        '' . $eol .
        '-->' . $eol .
        '<!-- $Id: index.html,v 1.76 2008/10/25 20:04:53 jhi Exp $ -->' . $eol .
        '<link rev="made" href="mailto:cpan@perl.org"></link>' . $eol .
        '<style type="text/css">' . $eol .
        '<!--' . $eol .
        '' . $eol .
        'body{' . $eol .
        '  color:black;' . $eol .
        '  background:white;' . $eol .
        '  margin-left:2%;' . $eol .
        '  margin-right:2%;' . $eol .
        '}' . $eol .
        '' . $eol .
        'h1{' . $eol .
        '  text-align:center;' . $eol .
        '}' . $eol .
        '' . $eol .
        'img     {' . $eol .
        '  vertical-align:        50%;' . $eol .
        '  border:       0;' . $eol .
        '}' . $eol .
        '' . $eol .
        '.left{' . $eol .
        '  text-align:left;' . $eol .
        '  float:none;' . $eol .
        '}' . $eol .
        '' . $eol .
        '.center{' . $eol .
        '  text-align:center;' . $eol .
        '  float:none;' . $eol .
        '}' . $eol .
        '' . $eol .
        '.right{' . $eol .
        '  text-align:right;' . $eol .
        '  float:none;' . $eol .
        '}' . $eol .
        '' . $eol .
        '-->' . $eol .
        '</style>' . $eol .
        '</head>' . $eol .
        '<body>' . $eol .
        '' . $eol .
        '<table width="100%">' . $eol .
        ' <tr>' . $eol .
        '  <td rowspan="2">' . $eol .
        '   <div class="left">' . $eol .
        '    <img src="misc/jpg/cpan.jpg"' . $eol .
        '         alt="[CPAN Logo]" height="77" width="250"/>' . $eol .
        '   </div>' . $eol .
        '  </td>' . $eol .
        '  <td>' . $eol .
        '   <div class="right">' . $eol .
        '    <h1><a id="top">Comprehensive Perl Archive Network</a></h1>' . $eol .
        '   </div>' . $eol .
        '  </td>' . $eol .
        ' </tr>' . $eol .
        ' <tr>' . $eol .
        '  <td>' . $eol .
        '    <div class="center">' . $eol .
        '    2009-05-06 online since 1995-10-26<br/>5536 MB 206 mirrors<br/>7349 authors 15693 modules' . $eol .
        '    </div>' . $eol .
        '  </td>' . $eol .
        ' </tr>' . $eol .
        ' <tr>' . $eol .
        '  <td colspan="2">' . $eol .
        '   <p class="left">' . $eol .
        'Welcome to CPAN!' . $eol .
        'Here you will find All Things Perl.' . $eol .
        '   </p>' . $eol .
        '  </td>' . $eol .
        '  <td>' . $eol .
        '  </td>' . $eol .
        ' </tr>' . $eol .
        '</table>' . $eol .
        '' . $eol .
        '<hr/>' . $eol .
        '' . $eol .
        '<table width="100%">' . $eol .
        '' . $eol .
        '<tr>' . $eol .
        '' . $eol .
        '<td>' . $eol .
        '' . $eol .
        '<h1>Browsing</h1>' . $eol .
        '<ul>' . $eol .
        '  <li><a href="modules/index.html">Perl modules</a></li>' . $eol .
        '  <li><a href="scripts/index.html">Perl scripts</a></li>' . $eol .
        '  <li><a href="ports/index.html">Perl binary distributions ("ports")</a></li>' . $eol .
        '  <li><a href="src/README.html">Perl source code</a></li>' . $eol .
        '  <li><a href="RECENT.html">Perl recent arrivals</a></li>' . $eol .
        '  <li><a href="http://search.cpan.org/recent">recent</a> Perl modules</li>' . $eol .
        '  <li><a href="SITES.html">CPAN sites</a> list</li>' . $eol .
        '  <li><a href="http://mirrors.cpan.org/">CPAN sites</a> map</li>' . $eol .
        '</ul>' . $eol .
        '' . $eol .
        '</td>' . $eol .
        '' . $eol .
        '<td>' . $eol .
        '' . $eol .
        '<h1>Searching</h1>' . $eol .
        '' . $eol .
        '<ul>' . $eol .
        '<li><a href="http://perldoc.perl.org/">Perl core documentation</a> (perldoc.perl.org; Jon Allen)</li>' . $eol .
        '<li><a href="http://kobesearch.cpan.org/">Perl core and CPAN modules documentation </a> (Randy Kobes)</li>' . $eol .
        '<li><a href="http://search.cpan.org/">CPAN modules, distributions, and authors</a> (search.cpan.org)</li>' . $eol .
        '<!-- a href="http://wait.cpan.org/">CPAN modules documentation</a> (Ulrich Pfeifer) -->' . $eol .
        '</ul>' . $eol .
        '' . $eol .
        '<h1>FAQ etc</h1>' . $eol .
        '' . $eol .
        '<ul>' . $eol .
        '<li><a href="misc/cpan-faq.html">CPAN Frequently Asked Questions</a></li>' . $eol .
        '<li><a href="http://faq.perl.org/">Perl FAQ</a></li>' . $eol .
        '<li><a href="http://lists.cpan.org/">Perl Mailing Lists</a></li>' . $eol .
        '<li><a href="http://bookmarks.cpan.org/">Perl Bookmarks</a></li>' . $eol .
        '</ul>' . $eol .
        '' . $eol .
        '<p><small>' . $eol .
        'Yours Eclectically, The Self-Appointed Master Librarian (OOK!) of the CPAN<br/>' . $eol .
        '<i>Jarkko Hietaniemi</i>' . $eol .
        '<a href="mailto:cpan@perl.org">cpan@perl.org</a>' . $eol .
        '<a href="disclaimer.html">[Disclaimer]</a>' . $eol .
        '2001-04-01' . $eol .
        '</small>' . $eol .
        '</p>' . $eol .
        '' . $eol .
        '</td>' . $eol .
        '' . $eol .
        '</tr>' . $eol .
        '' . $eol .
        '</table>' . $eol .
        '' . $eol .
        '<hr/>' . $eol .
        '' . $eol .
        '<table width="100%">' . $eol .
        '<tr>' . $eol .
        '' . $eol .
        '<td>' . $eol .
        '<div class="left">' . $eol .
        '<a href="http://validator.w3.org/check?uri=http%3A%2F%2Fwww.cpan.org%2Findex.html">' . $eol .
        '<img src="misc/gif/valid-xhtml10.gif" alt="Valid XHTML 1.0!" height="31" width="88"/></a>' . $eol .
        '<a href="http://jigsaw.w3.org/css-validator/validator?uri=http%3A%2F%2Fwww.cpan.org%2Findex.html"><img src="misc/gif/vcss.gif" alt="[Valid CSS]" height="31" width="88"/></a>' . $eol .
        '</div>' . $eol .
        '</td>' . $eol .
        '<td>' . $eol .
        '<div class="right">' . $eol .
        '' . $eol .
        '<table width="100%">' . $eol .
        '' . $eol .
        '<tr>' . $eol .
        '<td class="right">' . $eol .
        '<small>' . $eol .
        'CPAN master site hosted by' . $eol .
        '</small>' . $eol .
        '</td>' . $eol .
        '</tr>' . $eol .
        '<tr>' . $eol .
        '<td class="right">' . $eol .
        '<a href="http://www.csc.fi/english/institutions/funet_en/about"><img src="misc/gif/funet.gif" alt="FUNET" height="25" width="88"/></a>' . $eol .
        '</td>' . $eol .
        '</tr>' . $eol .
        '</table>' . $eol .
        '' . $eol .
        '</div>' . $eol .
        '</td>' . $eol .
        '' . $eol .
        '</tr>' . $eol .
        '</table>' . $eol .
        '' . $eol .
        '</body>' . $eol .
        '</html>' . $eol;

} } );

cmpthese $r, 'all';

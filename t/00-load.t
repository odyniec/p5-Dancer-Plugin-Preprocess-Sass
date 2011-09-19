#!perl -T

use Test::More tests => 1;

BEGIN {
    use_ok( 'Dancer::Plugin::Preprocess::Sass' ) || print "Bail out!
";
}

diag( "Testing Dancer::Plugin::Preprocess::Sass $Dancer::Plugin::Preprocess::Sass::VERSION, Perl $], $^X" );

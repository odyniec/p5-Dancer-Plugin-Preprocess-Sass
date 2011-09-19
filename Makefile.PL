use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME                => 'Dancer::Plugin::Preprocess::Sass',
    AUTHOR              => q{Michal Wojciechowski <odyniec@cpan.org>},
    VERSION_FROM        => 'lib/Dancer/Plugin/Preprocess/Sass.pm',
    ABSTRACT_FROM       => 'lib/Dancer/Plugin/Preprocess/Sass.pm',
    ($ExtUtils::MakeMaker::VERSION >= 6.3002
      ? ('LICENSE'=> 'perl')
      : ()),
    PL_FILES            => {},
    PREREQ_PM => {
        'Dancer' => 1.3070,
        'Test::More' => 0,
        'Text::Sass' => 0,
    },
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'Dancer-Plugin-Preprocess-Sass-*' },
);

package MY;

sub MY::postamble
{
    my $self = shift;
    
    return if ! -r $self->{VERSION_FROM};
    
    return <<END_MAKE;
pm_to_blib: README README.pod
    
README.pod: $self->{VERSION_FROM}
\t\@perldoc -uT $self->{VERSION_FROM} > README.pod

README: $self->{VERSION_FROM}
\tpod2text README.pod > README
END_MAKE
}

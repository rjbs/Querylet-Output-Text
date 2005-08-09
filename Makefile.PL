use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME                => 'Querylet::Output::Text',
    AUTHOR              => 'Ricardo SIGNES <rjbs@cpan.org>',
    VERSION_FROM        => 'lib/Querylet/Output/Text.pm',
    ABSTRACT_FROM       => 'lib/Querylet/Output/Text.pm',
    PL_FILES            => {},
    PREREQ_PM => {
        'Test::More'  => 0,
        'Text::Table' => 1,
        'Querylet::Query'  => 0.28,
        'Querylet::Output' => 0.16,
    },
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'Querylet-Output-Text-*' },
);

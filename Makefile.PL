use ExtUtils::MakeMaker;

WriteMakefile(
    NAME                => 'Carp::Assert::More',
    VERSION_FROM        => 'More.pm', # finds $VERSION

    PM => {
        'More.pm'       => '$(INST_LIB)/Carp/Assert/More.pm',
    },

    PREREQ_PM   => {
        Carp                => 0,
        'Carp::Assert'      => 0,
        'Test::More'        => 0.18,
        'Scalar::Util'      => 0,
        'Test::Exception'   => 0,       
    },

    dist => {
        COMPRESS        => 'gzip -9',
        SUFFIX          => '.gz',
        DIST_DEFAULT    => 'all tardist',
    },
);

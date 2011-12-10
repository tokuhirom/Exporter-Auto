use strict;
use warnings;
use Module::Build;

my $build = Module::Build->new(
    license              => 'perl',
    dynamic_config       => 0,

    build_requires       => {
        'Test::More' => '0.98',
    },
    configure_requires   => { 'Module::Build' => '0.38' },
    requires             => {
        'parent'                        => '0',
        'Sub::Identify' => 0,
        'B::Hooks::EndOfScope' => 0,
        perl => '5.008005',
    },

    no_index    => { 'directory' => [ 'inc' ] },
    name        => 'Exporter-Auto',
    module_name => 'Exporter::Auto',

    # script_files => [''],

    test_files => (-d '.git' || $ENV{RELEASE_TESTING}) ? 't/ xt/' : 't/',
    recursive_test_files => 1,
   
    create_readme  => 1,
    create_license => 1,
);
$build->create_build_script();

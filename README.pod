package Exporter::Auto;
use strict;
use warnings;
use 5.008005;
our $VERSION = '0.02';

use Sub::Identify qw(stash_name);
use B::Hooks::EndOfScope;
use Exporter;

sub import {
    my $klass = caller(0);

    no strict 'refs';
    unshift @{"${klass}::ISA"}, 'Exporter';

    on_scope_end {
        while (my ($k, $v) = each %{"${klass}::"}) {
            next if $k =~ /^(?:BEGIN|CHECK|END)$/;
            next if $k =~ /^_/;
            next unless *{"${klass}::${k}"}{CODE};
            next if $klass ne stash_name($klass->can($k));
            push @{"${klass}::EXPORT"}, $k;
        }
    };
}

1;
__END__

=encoding utf8

=head1 NAME

Exporter::Auto - Export public functions automatically.

=head1 SYNOPSIS

    package Foo;
    use Exporter::Auto;

    sub foo { }

    package main;
    use Foo;
    foo();  # <= this function was exported!

=head1 DESCRIPTION

I'm tired to push function names to @EXPORT. Perl5 should add functions automatically!!!111

=head1 AUTHOR

Tokuhiro Matsuno E<lt>tokuhirom AAJKLFJEF@ GMAIL COME<gt>

=head1 SEE ALSO

This module uses magical L<B::Hooks::EndOfScope>.
If you think this module is too clever, please try L<Module::Functions> instead.

=head1 LICENSE

Copyright (C) Tokuhiro Matsuno <TOKUHIROM @ GMAIL COM

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

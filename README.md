# NAME

Exporter::Auto - Export public functions automatically.

# SYNOPSIS

    package Foo;
    use Exporter::Auto;

    sub foo { }

    package main;
    use Foo;
    foo();  # <= this function was exported!

# DESCRIPTION

I'm tired to push function names to @EXPORT. Perl5 should add functions automatically!!!111

# AUTHOR

Tokuhiro Matsuno <tokuhirom AAJKLFJEF@ GMAIL COM>

# SEE ALSO

This module uses magical [B::Hooks::EndOfScope](http://search.cpan.org/perldoc?B::Hooks::EndOfScope).
If you think this module is too clever, please try [Module::Functions](http://search.cpan.org/perldoc?Module::Functions) instead.

# LICENSE

Copyright (C) Tokuhiro Matsuno <TOKUHIROM @ GMAIL COM

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

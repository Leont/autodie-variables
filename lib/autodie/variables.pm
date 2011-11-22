package autodie::variables;
use strict;
use warnings;

use XSLoader;

XSLoader::load(__PACKAGE__, __PACKAGE__->VERSION);

_reset_global($_) for ($<, $>, $(, $));

sub import {
	$^H |= 0x020000;
	$^H{autodie_variables} = 1;
	return;
}

sub unimport {
	$^H |= 0x020000;
	$^H{autodie_variables} = 0;
	return;
}

1;

# ABSTRACT: Safe user and group ID variables

__END__

=head1 SYNOPSIS

 use autodie::variables;

 local $> = $<;

=head1 DESCRIPTION

This module overrides the magic on the user and group ID variables (C<< $< >>, C<< $> >>, C<$(>, C<$)>) to throw errors when assignment to them fails.

=begin Pod::Coverage

unimport

=end Pod::Coverage

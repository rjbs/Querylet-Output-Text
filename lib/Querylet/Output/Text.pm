package Querylet::Output::Text;
use base qw(Querylet::Output);

use warnings;
use strict;

=head1 NAME

Querylet::Output::Text - output querylet results to text tables

=head1 VERSION

version 0.112

 $Id$

=cut

our $VERSION = '0.112';

use Text::Table;

=head1 SYNOPSIS

 use Querylet;
 use Querylet::Output::Text;

 database: dbi:SQLite2:dbname=cpants.db

 query:
   SELECT kwalitee.dist,kwalitee.kwalitee
   FROM   kwalitee
   JOIN   dist ON kwalitee.distid = dist.id
   WHERE  dist.author = 'RJBS'
   ORDER BY kwalitee.dist;

 output format: text

=head1 DESCRIPTION

This module registers an output handler to produce plaintext tables, using
Text::Table.

=over 4

=item C<< default_type >>

The default type for Querylet::Output::Text is "text"

=cut

sub default_type { 'text' }

=item C<< handler >>

The output handler uses Text::Table to print a simple table, suitable for
reading at the console.

=cut

sub handler      { \&_as_text_table }
sub _as_text_table {
	my ($query) = @_;
	my $results = $query->results;
	my $columns = $query->columns;

	my $table = Text::Table->new(map { $query->header($_) } @$columns);
	   $table->load(map { [ @$_{@$columns} ] }  @$results);
	return "$table";
}

=back

=head1 AUTHOR

Ricardo SIGNES, C<< <rjbs@cpan.org> >>

=head1 BUGS

Please report any bugs or feature requests to
C<bug-querylet-output-text@rt.cpan.org>, or through the web interface at
L<http://rt.cpan.org>.  I will be notified, and then you'll automatically be
notified of progress on your bug as I make changes.

=head1 COPYRIGHT

Copyright 2004 Ricardo SIGNES, All Rights Reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut

1;

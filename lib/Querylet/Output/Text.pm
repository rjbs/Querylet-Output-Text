use strict;
use warnings;
package Querylet::Output::Text;
use parent qw(Querylet::Output);
# ABSTRACT: output querylet results to text tables

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

=method default_type

The default type for Querylet::Output::Text is "text"

=cut

sub default_type { 'text' }

=method handler

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

1;

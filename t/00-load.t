use Test::More tests => 2;

BEGIN {
  use_ok('Querylet::Query');
  use_ok('Querylet::Output::Text');
}

diag( "Testing  $Querylet::Output::Text::VERSION" );

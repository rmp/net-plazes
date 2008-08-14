use strict;
use warnings;
use Test::More tests => 6;
use t::useragent;

use_ok('Net::Plazes::User');

my $ua = t::useragent->new({
                            is_success => 1,
                           });

{
  my $u = Net::Plazes::User->new();
  isa_ok($u, 'Net::Plazes::User');
}

{
  my $u = Net::Plazes::User->new({
				  useragent => $ua,
				  id        => 263471,
				 });
  is($u->full_name(), 'Eran');
  is($u->name(), 'erox');
  is($u->about(), q[]);
  is($u->created_at(), '2008-07-28T13:00:53Z');
}

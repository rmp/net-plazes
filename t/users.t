use strict;
use warnings;
use Test::More tests => 10;
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

{
  my $u = Net::Plazes::User->new({
				  useragent => $ua,
				 });
  my $users = $u->users();
  isa_ok($users, 'ARRAY');
  isa_ok($users->[0], 'Net::Plazes::User');
  is((scalar @{$users}), 86);
  is($users->[0]->id(), 50564194);
}

use strict;
use warnings;
use Test::More tests => 17;
use t::useragent;

use_ok('Net::Plazes::Presence');

my $ua = t::useragent->new({
			    is_success => 1,
			   });

{
  my $p = Net::Plazes::Presence->new();
  isa_ok($p, 'Net::Plazes::Presence');
}

{
  my $p = Net::Plazes::Presence->new({
				      useragent => $ua,
				      id        => 81451330,
				     });
  is($p->device(), 'web');
  is($p->status(), 'a little php programming, feels sentimental');
  is($p->user_id(), '266');
}

{
  my $p = Net::Plazes::Presence->new({
				      useragent => $ua,
				     });
  my $presences = $p->presences();
  isa_ok($presences, 'ARRAY');
  is((scalar @{$presences}), 100);

  isa_ok($presences->[0], 'Net::Plazes::Presence', 'presences.user[0]');
  is($presences->[0]->id(), 81451330, 'presences.user[0] id');

  isa_ok($presences->[-1], 'Net::Plazes::Presence', 'presences.user[-1]');
  is($presences->[-1]->user_id(), 1185, 'presences.user[-1] user_id');
}

{
  my $p = Net::Plazes::Presence->new({
				      useragent => $ua,
				      id        => 81451330,
				     });
  my $user = $p->user();
  isa_ok($user, 'Net::Plazes::User', 'presence.user');
  is($user->id(), 266, 'presence.user id');
  is($user->full_name(), 'Tilmann Singer', 'presence.user full_name');

  my $plaze = $p->plaze();
  isa_ok($plaze, 'Net::Plazes::Plaze', 'presence.plaze');
  is($plaze->id(), 60501572, 'presence.plaze id');
  is($plaze->name(), 'Firma Singer', 'presence.plaze name');

}

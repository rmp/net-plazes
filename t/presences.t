use strict;
use warnings;
use Test::More tests => 11;
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

  isa_ok($presences->[0], 'Net::Plazes::Presence');
  is($presences->[0]->id(), 81451330);

  isa_ok($presences->[-1], 'Net::Plazes::Presence');
  is($presences->[-1]->user_id(), 1185);
}

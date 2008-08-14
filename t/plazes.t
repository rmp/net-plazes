use strict;
use warnings;
use Test::More tests => 11;
use t::useragent;

use_ok('Net::Plazes::Plaze');

my $ua = t::useragent->new({
			    is_success => 1,
			   });

{
  my $p = Net::Plazes::Plaze->new();
  isa_ok($p, 'Net::Plazes::Plaze');
}

{
  my $p = Net::Plazes::Plaze->new({
				   useragent => $ua,
				   id        => 60501572,
				  });
  like($p->address(), qr/K.lblgasse\ 21/mx);
  is($p->category(), 'shop');
  is($p->country(), 'Austria');
}

{
  my $p = Net::Plazes::Plaze->new({
				   useragent => $ua,
				  });
  my $plazes = $p->plazes();
  isa_ok($plazes, 'ARRAY');
  is((scalar @{$plazes}), 100);

  isa_ok($plazes->[0], 'Net::Plazes::Plaze');
  like($plazes->[0]->address(), qr/G.rtel/mx);

  isa_ok($plazes->[-1], 'Net::Plazes::Plaze');
  like($plazes->[-1]->address(), qr/Flughafen\ Tegel/mx);
}

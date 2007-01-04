# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl test.pl'

# much of this test code is blatently ripped out of the test code from
# Ogg::Vorbis::Header.
# This is in part due to laziness and in part to try to ensure the
# two modules share the same API.

#########################

# change 'tests => 1' to 'tests => last_test_to_print';

use Test;
BEGIN { plan tests => 10 };
use Ogg::Vorbis::Header::PurePerl;
ok(1); # If we made it this far, we're ok.

#########################

# Insert your test code below, the Test module is use()ed here so read
# its man page ( perldoc Test ) for help writing this test script.


# See if partial load works
ok(my $ogg = Ogg::Vorbis::Header::PurePerl->new('test.ogg'));

# See if load_after works
ok($ogg->load);

# Try all the routines
ok($ogg->info->{'rate'} == 44100);
ok($ogg->comment_tags);
ok(@{$ogg->comment('artist')}->[0] == 'maloi');

$ogg = 0;

# See if full load works
ok(my $ogg = Ogg::Vorbis::Header::PurePerl->load('test.ogg'));
ok(@{$ogg->comment('artist')}->[0] == 'maloi');

# and see if we can get comments including the '=' character
ok(@{$ogg->comment('album')}->[0] == 'this=that');

# Make sure we're getting the right track length
ok($ogg->info->{'length'} == 0);

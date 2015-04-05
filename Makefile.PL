use ExtUtils::MakeMaker;

WriteMakefile(
	'NAME'		=> 'Ogg::Vorbis::Header::PurePerl',
	'VERSION_FROM'	=> 'lib/Ogg/Vorbis/Header/PurePerl.pm',
	'PREREQ_PM'		=> {},
	($] >= 5.005 ?
	(ABSTRACT_FROM => 'lib/Ogg/Vorbis/Header/PurePerl.pm',
	AUTHOR     => 'Dan Sully <daniel@cpan.org>') : ()),
);

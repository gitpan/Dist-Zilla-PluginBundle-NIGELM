
use strict;
use warnings;



use ExtUtils::MakeMaker 6.31;



my %WriteMakefileArgs = (
  'ABSTRACT' => 'Build your distributions like FLORA does with NIGELM tweaks',
  'AUTHOR' => 'Nigel Metheringham <nigelm@cpan.org>',
  'BUILD_REQUIRES' => {
    'File::Find' => '0',
    'File::Temp' => '0',
    'Test::More' => '0'
  },
  'CONFIGURE_REQUIRES' => {
    'ExtUtils::MakeMaker' => '6.31'
  },
  'DISTNAME' => 'Dist-Zilla-PluginBundle-NIGELM',
  'EXE_FILES' => [],
  'LICENSE' => 'perl',
  'NAME' => 'Dist::Zilla::PluginBundle::NIGELM',
  'PREREQ_PM' => {
    'Dist::Zilla::Plugin::FakeRelease' => '0',
    'Dist::Zilla::Plugin::ReadmeFromPod' => '0',
    'Dist::Zilla::PluginBundle::FLORA' => '0.13',
    'Dist::Zilla::PluginBundle::Git' => '0',
    'Method::Signatures::Simple' => '0',
    'Moose' => '1.00',
    'Moose::Util::TypeConstraints' => '0',
    'MooseX::Types::Email' => '0',
    'MooseX::Types::Moose' => '0',
    'MooseX::Types::Structured' => '0.20',
    'MooseX::Types::URI' => '0',
    'namespace::autoclean' => '0'
  },
  'VERSION' => '0.02',
  'test' => {
    'TESTS' => 't/*.t'
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);




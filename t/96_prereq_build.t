#!/usr/bin/perl

use strict;
use warnings;

use Test::More;
use English qw(-no_match_vars);

$ENV{TEST_AUTHOR} or plan(
    skip_all => 'Author test. Set (export) $ENV{TEST_AUTHOR} to a true value to run.'
);

eval 'use Test::Prereq::Build';

if ( $EVAL_ERROR ) {
    my $msg = 'Test::Prereq::Build not installed; skipping';
    plan( skip_all => $msg );
}

# workaround for the bugs of Test::Prereq::Build
my @skip_workaround = qw{
    Test::Class::Hyper::Developer
    Test::Hyper::Developer::Generator::Control::Flow
};


# These modules should not go into Build.PL
my @skip_devel_only = qw{
    Test::Kwalitee
    Test::Perl::Critic
    Test::Prereq::Build
};

my @skip = (
    @skip_workaround,
    @skip_devel_only,
);

prereq_ok( undef, undef, \@skip );

#!/usr/bin/perl

use strict;
use warnings;

use File::Basename;
use File::Spec;


BEGIN {
    require lib;
    lib->import( grep { -d $_ }
        map { File::Spec->rel2abs(dirname(__FILE__) . "/$_"); }
            qw(lib ../lib ../blib/lib)
    );
}
our %PATH_OF = (
    t    => dirname(__FILE__),
    libs => [ grep { -d $_ }
        map { File::Spec->rel2abs(dirname(__FILE__) . "/$_"); }
            qw(lib ../lib ../blib/lib)
    ],
);

use Test::Class::Hyper::Developer;
use Test::Hyper::Developer::Generator::Control::Flow;

Test::Class::Hyper::Developer->runtests();

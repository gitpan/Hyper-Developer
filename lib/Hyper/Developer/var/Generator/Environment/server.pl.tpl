#!/usr/bin/perl

use strict;
use warnings;

use lib qw([% this.get_base_path %]/lib);

use Hyper::Developer::Server;
use Hyper::Singleton::Context;
Hyper::Singleton::Context->new({
    file => '[% this.get_base_path %]/etc/[% this.get_namespace %]/Context.ini',
});

Hyper::Developer::Server->new()->run();

__END__

=pod

=head1 NAME

 [% this.get_namespace %] - a Hyper Developer Test Server

=head1 DESCRIPTION

 Test Server for [% this.get_namespace %]

=cut
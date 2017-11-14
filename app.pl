#!/usr/bin/perl

use Mojolicious::Lite;
use strict;

plugin 'digest_auth', 
  realm   => 'app',
  expires => 120,
  allow   => '.htdigest'
;

get '/' => sub {
  my $c = shift;
  return unless $c->digest_auth;
  $c->render( text => 'hello world' );
};

app->start;


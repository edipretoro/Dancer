#!/usr/bin/perl

use Dancer;

get '/' => sub {
    "Hello There!"
};

get '/hello/:name' => sub {
    my ($params) = @_;
    return "Hey ".$params->{name}.", how are you?";
};

post '/new' => sub {
    my ($params) = @_;
    "creating new entry: ".$params->{name};
};

Dancer->dance;
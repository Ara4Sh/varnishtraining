vcl 4.0;

import std;
import directors;

probe web {
    .url = "/";
    .interval  = 5s;
    .timeout   = 1s;
    .window    = 5;
    .threshold = 3;
}

backend nginx {
    .host = "nginx";
    .port = "80";
    .probe = web;
}

backend nginx2 {
    .host = "nginx2";
    .port = "80";
    .probe = web;
}

sub vcl_init {
    new vdir = directors.round_robin();
    vdir.add_backend(nginx);
    vdir.add_backend(nginx2);
}

sub vcl_recv {
    set req.backend_hint = vdir.backend();
}
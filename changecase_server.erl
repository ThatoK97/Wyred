-module(changecase_server).
-export([start/0, loop/0]).

start() ->
    spawn(changecase_server, loop, []).

loop() -> 
    receive
        {Client, {Str, uppercase}} ->
            Client ! {self(), string:to_upper(Str)};
        {Client, {Str, lowercase}} -> 
            Client ! {self(), string:to_lower(Str)}
    end,
    loop().
%%%-------------------------------------------------------------------
%% @doc nova_admin public API
%% @end
%%%-------------------------------------------------------------------

-module(chatapp_app).

-behaviour(application).

%% Application callbacks
-export([start/2, stop/1]).

%%====================================================================
%% API
%%====================================================================

start(_StartType, _StartArgs) ->
    ets:new(users, [named_table]),
    start_redis(),
    
    % ex_banking:start_link(xx,xx),
    chatapp_sup:start_link().

%%--------------------------------------------------------------------
stop(_State) ->
    ok.

start_redis()->
    P=open_port({spawn,"redis-server"},[]),
    io:format("Opened port:~p",[P]).
%%====================================================================
%% Internal functions
%%====================================================================

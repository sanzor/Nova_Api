-module(user_controller).
-export([get_user_value/1,
        add/1]).



get_user_value(#{ bindings:= #{<<"user">> :=UserId}})->
    case ets:lookup(users, UserId) of
        []->{status,404};
        [{UserId,Value}]->{json,200,#{},#{<<"id">> =>UserId,<<"value">>=>Value}}
end.

add(#{json := #{id := Id, age := Age}})->
    try
        P=eredis:start_link(),
        Result=eredis:q(P,["hset","users"|[Id,Age]]),
        {json,200,#{},#{<<"result">>=>Result}}
    catch
        Error:Cause -> {json,500,#{},#{<<"error">> =>Error , <<"cause">> => Cause}}
      end.

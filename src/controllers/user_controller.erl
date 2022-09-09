-module(user_controller).
-export([get_user_value/1]).



get_user_value(#{ bindings:= #{<<"user">> :=UserId}})->
    case ets:lookup(users, UserId) of
        []->{status,404};
        [{UserId,Value}]->{json,200,#{},#{<<"id">> =>UserId,<<"value">>=>Value}}
end.

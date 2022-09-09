-module(chatapp_router).
-behaviour(nova_router).

-export([
         routes/1
        ]).

%% The Environment-variable is defined in your sys.config in {nova, [{environment, Value}]}
routes(_Environment) ->
    [#{prefix => "",
      security => false,
      routes => [
                 {"/", { chatapp_main_controller, index}, #{methods => [get]}},
                 {"/assets/[...]", "assets"}
                ]
      }
    %   #{prefix=>"/users",
    %   security=>false,
    %   routes=>[
    %     {"/get_all",{user_controller,index},#{methods=>[get]}}
    % ]
    ].

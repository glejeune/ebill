-module(ebill_storage_handler).

-export([init/3]).
-export([handle/2]).
-export([terminate/3]).

init(_Transport, Req, []) ->
	{ok, Req, undefined}.

handle(Req, State) ->
  URL = ebill_data:db_url() ++ "/_utils",
  {ok, Reply} = cowboy_req:reply(
    302,
    [{<<"Location">>, list_to_binary(URL)}],
    <<"Redirecting to sofa!">>,
    Req
  ),
  {ok, Reply, State}.

terminate(_Reason, _Req, _State) ->
	ok.


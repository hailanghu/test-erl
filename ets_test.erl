-module (ets_test).
-export ([start/0]).

start() ->
	lists:foreach(fun teste_ets/1, [set, ordered_set, bag, duplicate_bag]).

teste_ets(Mode) ->
	TableId = ets:new(test, [Mode]),
	ets:insert(TableId, {a, 1}),
	ets:insert(TableId, {b, 2}),
	ets:insert(TableId, {a, 1}),
	ets:insert(TableId, {a, 3}),
	List = ets:tab2list(TableId),
	io:format("~-13w => ~p~n", [Mode, List]),
	ets:delete(TableId).

%1> ets_test:start().
%set           => [{b,2},{a,3}]
%ordered_set   => [{a,3},{b,2}]
%bag           => [{b,2},{a,1},{a,3}]
%duplicate_bag => [{b,2},{a,1},{a,1},{a,3}]
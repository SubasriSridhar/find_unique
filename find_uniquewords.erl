% Name : Subasri Sridhar 	 %

-module(find_uniquewords).
-export([load/1,count/1,unique/1]).

%Load the file%
load(F)->
{ok, List} = file:read_file(F),
   L=erlang:binary_to_list(List),
   %S1 = string:tokens(erlang:binary_to_list(List), ""),
   S1=string:tokens(L,"\n\s\r\t\"0123456789&*()-_!$%+=[]{}:;?\"'/><.,"),
   %io:format("~p~n", [S1]),
   Result=count(S1),
Result.

%Removes the duplicate by sorting based on Pivot i.e, any text same as pivot will be ignored

unique([Pivot|T]) ->
    unique([ X || X <- T, X < Pivot]) ++
    [Pivot] ++
    unique([ X || X <- T, X > Pivot]);
unique([]) -> [].

%Calculates the length of a list

count([Pivot|T])->
X = unique([Pivot|T]),
Y = countFun(X,0),
Y.

countFun([],Cnt) -> Cnt; 
countFun([_|T],Cnt) -> countFun(T,Cnt+1). 

(* 065982415 somriguy@t2 036567055 gai@tx *)

fun sum f a [] = [] |
	sum f a (x::xs) = f(a,x)::sum(f)(f(a,x))(xs);

val intArray 	= [1,2,~3,4];
val boolArray 	= [true,true,false,false];
val stringArray = ["Shrik Shrik","Shrik Shrak","bool","La",""];
val charArray		= [#"t", #"e", #"s", #"t"];


(*sumIntToReal check*)
fun add((x:real),(y:int)) = x+real(y);
sum add 12.2 intArray;

(*sumIntToBool check*)
infix xor;
fun a xor b = (a andalso (not b)) orelse (b andalso (not a));
fun intToBool((x:bool),(y:int)) = x xor (y > 0);
sum intToBool false intArray;

(*sumBoolToInt check*)
fun boolToInt (x:int, y:bool) = if (y) then x+1 else x-1;
sum boolToInt 42 boolArray;

(*sumStringToInt check*)
fun addIntStr(num,str) = num+size(str);
sum addIntStr 42 stringArray;

(*sumCharToSting check*)
fun addCharToString(x,y) = x^str(y);
sum addCharToString "hey" charArray;

(* question 2 *)
local
	(* actual tail recursion *)
	fun irev_t ([], ys) = ys |
		irev_t (x::xs, ys) = irev_t(xs, x::ys);
in		
	fun irev l = irev_t(l, []);
end;

irev ["h", "e", "l", "l", "o"];
irev [[1,2,3], [4,5,6], [7], [8,9]];


(* question 3 *)
local
	(* create a new function f(g(x)) out of f and g *)
	fun comp (f:'a->'a) (g:'a->'a) x = f(g(x));
in
	fun compList (f:'a->'a) 0 = [] |
		compList (f:'a->'a) i = f::map(comp(f))(compList(f)(i-1));  
end;

fun mul3 x = x*3;
map(fn f => f(1))(compList mul3 10);
map(fn f => f(1))(compList mul3 0);
map(fn f => f(0))(compList mul3 10);
fun fib (x,y) = (y+x, x+y+y); (* get two fibbonachi numbers, get return the next two *)
map(fn f => f(0,1))(compList fib 8);


(* question 4 *)
(* use pivot - "quick sort" *)
fun mySort lt [] = [] |
		mySort lt (x::xs) = (mySort(lt)(List.filter (fn a => lt(a, x)) xs))@(x::mySort(lt)(List.filter (fn a => not(lt(a,x))) xs));
		
fun lair (x,y) = true; (* no order at all! *)
fun lt (x,y) = x < y;
mySort lt [123, 133, 889, 45, 7, ~33];
mySort lair [123, 133, 889, 45, 7, ~33];
fun listLt (x,y) = length(x) < length(y);
mySort listLt [[], [1, 1, 1, 1], [2], [3, 3], [4], [5, 5, 6, 7, 8, 9, 10, 12, 44], [10000]];

(* question 5 *)
local
	(* concat list of lists to a single list *) 
	fun union [] = [] |
		union (x::xs) = x@union(xs);
in
fun getPaths (E:(''a*''a) list) (v1:''a) (v2:''a) = if (v1=v2) then [[v1]] else 
	union(
		map(fn (x,y) => 
			map(fn u => x::u)
				 (getPaths(List.filter (fn (z,w) => not (w=v1)) E)(y)(v2)
			)
		)		
		(List.filter (fn (z,w) => z=v1) E)
	);
end;

getPaths [] 1 2; (* empty graph *)
getPaths [(1,2), (2,3), (3,4), (4,5), (5,6)] 1 6; (* long one direction "bus" *)
getPaths [(1,2), (2,3), (3,4), (4,5), (5,6)] 6 1;
(* two directional "8" *)
getPaths [(1,2), (2,1), (2,3), (3,2), (1,3), (3,1), (3,4), (4,3), (4,5), (5,3), (3,5)] 1 2;
getPaths [(1,2), (2,1), (2,3), (3,2), (1,3), (3,1), (3,4), (4,3), (4,5), (5,3), (3,5)] 1 5;

		

(* 065982415 somriguy@t2 036567055 gai@tx *)

fun sum f a [] = [] |
	sum f a (x::xs) = f(a,x)::sum(f)(f(a,x))(xs);
	
(* question 2 *)
local
	(* actual tail recursion *)
	fun irev_t ([], ys) = ys |
		irev_t (x::xs, ys) = irev_t(xs, x::ys);
in		
	fun irev l = irev_t(l, []);
end;


(* question 3 *)
local
	(* create a new function f(g(x)) out of f and g *)
	fun comp (f:'a->'a) (g:'a->'a) x = f(g(x));
in
	fun compList (f:'a->'a) 0 = [] |
		compList (f:'a->'a) i = f::map(comp(f))(compList(f)(i-1));  
end;

(* question 4 *)
(* use pivot - "quick sort" *)
fun mySort lt [] = [] |
		mySort lt (x::xs) = (mySort(lt)(List.filter (fn a => lt(a, x)) xs))@(x::mySort(lt)(List.filter (fn a => not(lt(a,x))) xs));

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
		

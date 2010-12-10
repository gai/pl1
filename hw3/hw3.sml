fun irev_t ([], ys) = ys |
		irev_t (x::xs, ys) = irev_t(xs, x::ys);
		
fun irev l = irev_t(l, []);

fun comp (f:'a->'a) (g:'a->'a) x = f(g(x));

fun compList (f:'a->'a) 0 = [] |
		compList (f:'a->'a) i = f::map(comp(f))(compList(f)(i-1));  


fun mySort lt [] = [] |
		mySort lt (x::xs) = (mySort(lt)(List.filter (fn a => lt(a, x)) xs))@(x::mySort(lt)(List.filter (fn a => not(lt(a,x))) xs));


local
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
		

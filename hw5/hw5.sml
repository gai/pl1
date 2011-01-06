datatype 'a seq = Nil | Cons of 'a *(unit -> 'a seq);

exception EmptySeq;
fun head(Cons(x,_))  = x		| head Nil = raise EmptySeq;
fun tail(Cons(_,xf)) = xf()		| tail Nil = raise EmptySeq;

fun uptoSeq m n = if (m>n) then Nil
					else Cons(m,fn()=>(uptoSeq (m+1) n));

fun seqToList _ Nil = []	|
	seqToList n (Cons(x,xf)) = 	if (n<=0) then [] 
									else (x::(seqToList (n-1) (xf())));

fun	listToSeq [] = Nil		|
	listToSeq (x::xs) = Cons(x, fn() => listToSeq(xs));

(* filterq_n:('a -> bool) -> int -> 'a seq -> 'a seq *)

fun filterq_n f n Nil = Nil |
	filterq_n f n a =	if (n<=0) then a
						else if (f(head(a))) then Cons((head(a)),fn()=>(filterq_n f (n-1) (tail(a))))
							 else filterq_n f n (tail(a));
(* examples *)
filterq_n (fn x => x mod 2=0) 3  (uptoSeq 1 10);
seqToList 10 it;
filterq_n (fn x => x mod 2=0) 3  (uptoSeq 1 2);
seqToList 10 it;
filterq_n (fn x => x mod 2=0) 8  (uptoSeq 1 10);
seqToList 10 it;

datatype 'a seq = Nil | Cons of 'a *(unit -> 'a seq);

exception EmptySeq;
fun head(Cons(x,_))  = x		| head Nil = raise EmptySeq;
fun tail(Cons(_,xf)) = xf()		| tail Nil = raise EmptySeq;

fun uptoSeq m n = 	if (m>n) then
						Nil
					else
						Cons(m,fn()=>(uptoSeq (m+1) n));

fun seqToList _ Nil = []	|
	seqToList n (Cons(x,xf)) = 	if (n<=0) then
									[]
								else
									(x::(seqToList (n-1) (xf())));

fun	listToSeq [] = Nil		|
	listToSeq (x::xs) = Cons(x, fn() => listToSeq(xs));
(* ************************************************************************** *)
(*Q1*)
(* filterq_n:('a -> bool) -> int -> 'a seq -> 'a seq 					*)
(* This function recieves a bollean function, a number n and a seq 		*)
(* It returns the first n numbers in the seq which the bollean function *)
(* returns true for. 													*)
fun filterq_n f n Nil = Nil |
	filterq_n f n a =	if (n<=0) then 
							a
						else 
							if (f(head(a))) then 
								Cons((head(a)),fn()=>(filterq_n f(n-1)(tail(a))))
							else 
							 	filterq_n f n (tail(a));
(* examples *)
filterq_n (fn x => x mod 2=0) 3  (uptoSeq 1 10);
seqToList 10 it;
filterq_n (fn x => x mod 2=0) 3  (uptoSeq 1 2);
seqToList 10 it;
filterq_n (fn x => x mod 2=0) 8  (uptoSeq 1 10);
seqToList 10 it;

(* ************************************************************************** *)
(*Q2*)
(*a*)
(* truncSeq: 'a seq -> int -> 'a seq *)
(* This function recieves a seq and a number n and returns a seq which 		*)
(* contains the first n elements in the original seqToList					*)
(* In case of n<=0 or if n is longer then seq length an EmptySeq exception	*)
(* is being raised. for Nil seq the function will return Nil				*)
fun truncSeq Nil n 	= 	Nil |
	truncSeq a n 	= 	if (n<=0) then raise EmptySeq
						else Cons((head(a)),fn()=>(truncSeq (tail(a)) (n-1) )); 			
(* examples *)
(* should return Nil *)
truncSeq Nil 8;
(* should raise EmptySeq *)
truncSeq (listToSeq[1,2,3,4,5]) (0);
(* should return only the first two elements *)
truncSeq (listToSeq[1,2,3,4,5]) 2;
tail it;
tail it;
(* should raise EmptySeq *)
tail it;

(*Q2*)
(*b*)

(* restartOnError: 'a seq -> 'a seq *)
(* This function recieves a seq and returns the same one except that it's 	*)
(* cyclic - using "tail" on the last element of seq won't raise an 			*)
(* exception and will return the origin seq insted							*)
local 
	fun restartOnErrorHelp a b = 	
						let 
							val left = head(a);
							val right = fn()=>(restartOnErrorHelp(tail(a))(b))
							handle EmptySeq => restartOnErrorHelp b b;
						in 
							Cons (left, right)
						end;
in
	fun restartOnError Nil 	= Nil |
		restartOnError a	= restartOnErrorHelp a a
end;
(* examples *)
(* should return Nil *)
restartOnError Nil;
(* should return a "cyclic" seq	*)
restartOnError (truncSeq (listToSeq[1,2,3,4,5]) 2);
tail it;
tail it;
tail it;

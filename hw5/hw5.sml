datatype 'a seq = Nil | Cons of 'a *(unit -> 'a seq);

exception EmptySeq;
fun head(Cons(x,_))  = x		| head Nil = raise EmptySeq;
fun tail(Cons(_,xf)) = xf()		| tail Nil = EmptySeq;



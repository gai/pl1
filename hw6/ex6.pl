/* 
  an empty list is a list, and  also a list with at least one element
*/
list([]).
list([_|_]).

/* examples - 
list([]). 
list([1]).
list(1).
list([1,2,3,[a,b],c]).
 */

/* 
  insert an element into an empty list generates one-element list
  insert X into a sortedlist starting with Y <= X is equivalent to adding X to the tail of 
  the sorted list
  insert X into sorted list starting with Y > X is equivalent to adding X at the begining  
*/
insert(X, [], [X]) :- !.
insert(X, [Y|L1], [Y|L2]) :- (X>=Y, !, insert(X,L1,L2)).
insert(X, [Y|L1], [X|L2]) :- (Y>X, !, [Y|L1]=L2).

/* examples - 
  insert(1, [], X).
  insert(1, [2,3], X).
  insert(1, [-1, 0], X).
  insert(1, [-1, 3, 6, 7, 22], X).
  insert(1, [2,3], [1,2,3]).
  insert(1, [2, 3], [2,3,1]).
  insert(X, [1,2], [0,1,2]).
*/

/* 
  an empty or one element list is sorted
  in case of a longer list - we call the predicate recursively on the tail, and add the head to it's
  place using "insert".
*/
insertsort([], []) :- !.
insertsort([X], [X]) :- !.
insertsort([X|Y], Z) :- (insertsort(Y,PART), ! ,insert(X, PART, Z)).

/* examples 
  
  insertsort([3,2,1], [1,2,3]).
  insertsort([3,1,2], [1,2,3]).
  insertsort([1,2,1,1,3], [1,1,1,2,3]).
  insertsort([], X).
  insertsort([4,1,5,5,55], X).
  insertsort([1,2,3], X).
  insertsort([X, 7, 2, 3], [1,2,3,7]).

*/

/*
  swaps the first non sorted elements in a list
  a list of two elements is trivial, a longer list - if both heads the same and less than the next
  element (in the first list) - swap the tails. otherwise - swap the first two elements and make 
  sure tails agree 
*/
swap([X,Y], [Y,X]) :- (!, Y<X).
swap([X|T1], [X|T2]) :- (T1=[Y1|_], !, Y1>=X, !, swap(T1, T2)).
swap([X|T1], [Y|T2]) :- (T1=[Y|T], T2=[X|T], Y<X).


bubblesort([], []).
bubblesort([X], [X]).
bubblesort(X, Y) :- (swap(X, X1),!, bubblesort(X1, Y)).
bubblesort([X|T1], [X|T1]).

mymerge([], X, X).
mymerge(X, [], X).
mymerge([H1|T1], [H2|T2], [H1|X]) :- ((H1 =< H2), mymerge(T1, [H2|T2], X)).
mymerge([H1|T1], [H2|T2], [H2|X]) :- ((H2 =< H1), mymerge([H1|T1], T2, X)).

divide([], [], []).
divide([X], [], [X]).
divide([H1|T1], [H2|T2], [H1|T3]) :- ((T3 = [H2|TT3]), divide(T1, T2, TT3)).

mergesort([], []).
mergesort([X], [X]).
mergesort(X, Y) :- (divide(X1, X2, X), mergesort(X1, S1), mergesort(X2, S2), mymerge(S1,S2,Y)).

binarytree(nil).
binarytree(tree(_, T1, T2)) :- (binarytree(T1), binarytree(T2)).

full(tree(_,nil,nil)) :- !.
full(tree(_,T1,T2)) :- (full(T1) , full(T2)).

depth(nil, 0) :- !.
depth(tree(_, nil, nil), 1) :- !.
depth(tree(_, T1, T2), N) :- (depth(T1, N1), depth(T2, N2), !, ((N1 >= N2, N is N1 + 1) ; (N1 < N2, N is N2 + 1))).

completedepth(nil, 0).
completedepth(tree(_,T1, T2), N) :- (completedepth(T1, N1), !, completedepth(T2, N1), !, N is N1+1).

complete(T) :- completedepth(T, _).


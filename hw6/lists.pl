list([]).
list([X|Y]).

insert(X, [], [X]).
insert(X, [Y|L1], [Y|L2]):-X>=Y,insert(X,L1,L2).
insert(X, [Y|L1], [X|L2]):-Y>=X,[Y|L1]=L2.

insertsort([], []).
insertsort([X], [X]).
insertsort([X|Y], Z) :- insertsort(Y,PART), insert(X, PART, Z).

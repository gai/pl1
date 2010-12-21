datatype ('a)superList = scalar of 'a | slist of 'a superList list;

fun flat_t ((scalar (S:'a)), res:((int*'a) list), depth:int) = res@[(depth, S)] |
    flat_t ((slist ([]:('a superList list))), res:((int*'a) list), depth:int) = res |
    flat_t ((slist ((L::xs):('a superList list))), res:((int*'a) list), depth:int) = flat_t(slist xs, res@flat_t(L, [], depth+1), depth);

fun flat L = flat_t(L, [], 0);

flat(slist [scalar 10, slist [scalar 11, slist [scalar 12]], slist [slist [ slist [scalar 13]]], scalar 14]);


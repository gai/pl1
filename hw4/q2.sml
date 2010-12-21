datatype ('a,'b) abtree = ab_leaf | 
                          ab_a of 'a*('a,'b) abtree*('a,'b) abtree | 
                          ab_b of 'b*('b,'b) abtree*('b,'b) abtree;


datatype ('a,'b, 'c) abctree = abc_leaf | 
                               abc_a of 'a*('a, 'b, 'c) abctree*('a, 'b, 'c) abctree | 
                               abc_b of 'b*('b, 'b, 'c) abctree*('b, 'b,'c) abctree | 
                               abc_c of 'b*('c, 'c, 'c) abctree*('c, 'c,'c) abctree;


ab_leaf;
ab_b (1,it,it);
ab_b (2,it,it);
ab_a (0.0,it,it);



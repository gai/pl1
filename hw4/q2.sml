datatype ('a,'b) abtree = leaf | 
                          atree of 'a*('a,'b) abtree*('a,'b) abtree | 
                          btree of 'b*('b,'b) abtree*('b,'b) abtree;


datatype ('a,'b, 'c) abctree = leaf | 
                               atree of 'a*('a, 'b, 'c) abctree*('a, 'b, 'c) abctree | 
                               btree of 'b*('b, 'b, 'c) abctree*('b, 'b,'c) abctree | 
                               ctree of 'b*('c, 'c, 'c) abctree*('c, 'c,'c) abctree;


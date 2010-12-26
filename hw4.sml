(*1.*)
	(*a.*)
		datatype 'a superList = 
							scalar of 'a |
							slist of 'a superList list;
	(*b.*)
		local
			fun flat_ (level:int,slist []) = [] |
				flat_ (level:int,scalar s) = [(level,s)] |
				flat_ (level:int,slist ((x::xs):('a superList list))) =
											 flat_(level+1,x)@flat_(level,slist(xs))
		in 
			fun flat l = flat_ (0,l)
		end;
		
(*2.*)
	(*a.*)
		datatype ('a,'b) abtree = 
							lf |
							ab_a of 'a*('a,'b) abtree*('a,'b) abtree |
							ab_b of 'b*('b,'b) abtree*('b,'b) abtree;
							
	(*b.*)
		datatype ('a,'b,'c) abctree = 
							lf |
							abc_a of 'a*('a,'b,'c) abctree*('a,'b,'c) abctree |
							abc_b of 'b*('b,'b,'c) abctree*('b,'b,'c) abctree |
							abc_c of 'c*('c,'c,'c) abctree*('c,'c,'c) abctree;
							
(*3.*)
		datatype prop = 
				Atom of string |
				Not of prop	|
				And of prop * prop |
				Or of prop * prop;
				
		And(Atom("bold"),Atom("beutiful"));
	(*a.*)						
		fun implies (a:prop, b:prop) = Or(Not a,b);
	(*b.*)
		fun xor (a:prop, b:prop) = Or(And(Not a,b) ,And(a,Not b));
	(*c.*)
		fun show (Atom a) = a |
			show (And(a:prop, b:prop)) = "("^show(a)^"&"^show(b)^")" |
			show (Or(a:prop, b:prop)) = "("^show(a)^"|"^show(b)^")" |
			show (Not(a:prop)) = "(~"^show(a)^")";
		(*examples*)
		show(Atom("bold"));
		show(And(Atom("bold"),Atom("beutiful")));
		show(Not(Or(Atom("smrat"),Atom("funny"))));
	(*d.*)
		local 
			fun nnf_step (Not(Not(p:prop))) = nnf_step(p) |
				nnf_step (Not(And(p:prop,q:prop))) = Or(Not(nnf_step(p)),Not(nnf_step(q))) |
				nnf_step (Not(Or(p:prop,q:prop))) = And(Not(nnf_step(p)),Not(nnf_step(q))) |
				nnf_step (Or(p:prop,q:prop)) = Or(nnf_step(p),nnf_step(q)) |
				nnf_step (And(p:prop,q:prop)) = And(nnf_step(p),nnf_step(q)) |
				nnf_step (p:prop) = p
		in 
			fun nnf (p:prop) = 
						let val q = nnf_step(p) in (
							if (p = q) then p 
							else nnf(q)
						) end; 
		end;
		(*examples*)
		val a = Not(Not(Atom("true")));
		show(a); show(nnf(a));
		val a = Not(And(Not(Atom("true")),Atom("false")));
		show(a); show(nnf(a));
	
	(*e.*)
		fun distrib (p:prop, And(q:prop, r:prop)) = 
						And(distrib(p,q),distrib(p,r)) |
			distrib (And(q:prop, r:prop),p:prop) = 
						And(distrib(q,p),distrib(r,p)) |
			distrib (p:prop,q:prop) = And(p,q);
		(*examples*)
		val p1 = Atom("p1"); val np1 = Not(p1);
		val p2 = Atom("p2"); val np2 = Not(p2);
		val p3 = Atom("p3"); val np3 = Not(p3);
		val p4 = Atom("p4"); val np4 = Not(p4);
		val a = And(Or(p1,Or(np2,p3)),And(Or(p1,p2),p4));
		val b = And(And(p1,np2),And(Or(p1,Or(p2,Or(p3,p4))),Or(Or(np1,np2),Or(np3,np4))));
		
		show(a);
		show(b);
		show(distrib(a,b));
			
	(*f.*)
		fun cnf(Atom p ) = Atom p |
			cnf(Not(p)) = Not(p) |
			cnf(And(Not(p),q:prop)) = And(Not(p),cnf(q)) |
			cnf(And(p:prop,Not(q))) = And(cnf(p),Not(q)) |
			cnf(And(p:prop,q:prop)) = And(cnf(p),cnf(q)) |
			cnf(Or(Not(p), q:prop)) = distrib(Not(p),cnf(q)) |
			cnf(Or(p:prop, Not(q))) = distrib(cnf(p),Not(q)) |
			cnf(Or(p:prop,q:prop)) = distrib(cnf(p),cnf(q));
			
  (*g.*)
    local
      local 
        fun or_taut(Or(p,q), r) = or_taut(p,q) orelse or_taut(p,r) orelse or_taut(q,r)
        |   or_taut(p, Or(q,r)) = or_taut(p,q) orelse or_taut(p,r) orelse or_taut(q,r)
        |   or_taut(Atom(p), Not(Atom(q))) = (p = q)
        |   or_taut(Not(Atom(p)), Atom(q)) = (p = q)
        |   or_taut(p) = false; (* Atom, two Atoms, or Two Not(Atoms) *)
      in 
        fun cnf_taut(Atom p)    = false
        |   cnf_taut(Not(p))    = false (* the input is CNF => p is an atom *)
        |   cnf_taut(And(p,q))  = cnf_taut(p) andalso cnf_taut(q)
        |   cnf_taut(Or(p,q))   = or_taut(p,q); 
      end;
    in
      fun taut(p) = cnf_taut(cnf(nnf(p)));
    end;
    
    taut(Atom("p1"));
    taut(Or(Atom("p"),Atom("p")));
    val a = Or(Atom("p"),Not(Atom("p")));
    show(nnf(a));
    taut(a);


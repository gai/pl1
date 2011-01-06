(* 065982415 somriguy@t2 036567055 gai@tx *)

(*1.*)
	(*a.*)
	(* every 'a superlist can be either 'a type or a nested 'a superlist*)
		datatype 'a superList = 
							scalar of 'a |
							slist of 'a superList list;
	(*b.*)
	(* This is a helper function, the step function of the function flat *)
	(* it gets a 'a superlist and a level, and returns every scalar 'a   *)
	(* in the list with a relative level to the first given one          *)
		local
			fun flat_ (level:int,slist []) = [] |
				flat_ (level:int,scalar s) = [(level,s)] |
				flat_ (level:int,slist ((x::xs):('a superList list))) =
											 flat_(level+1,x)@flat_(level,slist(xs))
		in 
		(* this is the main function of flat*)
			fun flat l = flat_ (0,l)
		end;
		
(*2.*)
	(*a.*)
	(* This is the abtree datatype declaration. 							*)
	(* every instant is either a 	leaf (unit) 							*)
	(* 								abtree or abtree contains only type 'b 	*)
		datatype ('a,'b) abtree = 
							ab_lf |
							ab_a of 'a*('a,'b) abtree*('a,'b) abtree |
							ab_b of 'b*('b,'b) abtree*('b,'b) abtree;
							
	(*b.*)
	(* This is the abtree datatype declaration. 							 *)
	(* every instant is either a 	leaf (unit) or							 *)
	(* 								abctree	or								 *)
	(* 								abctree contains only 'b and 'c	types or *)
	(* 								abctree contains only type 'c			 *)
		datatype ('a,'b,'c) abctree = 
							abc_qlf |
							abc_a of 'a*('a,'b,'c) abctree*('a,'b,'c) abctree |
							abc_b of 'b*('b,'b,'c) abctree*('b,'b,'c) abctree |
							abc_c of 'c*('c,'c,'c) abctree*('c,'c,'c) abctree;
							
(*3.*)
		datatype prop = 
				Atom of string |
				Not of prop	|
				And of prop * prop |
				Or of prop * prop;
				
	(*a.*)						
	(* This function gets two props and returns a prop c that is logicly equal *)
	(* to the prop "a->b" *)				
		fun implies (a:prop, b:prop) = Or(Not a,b);
	(*b.*)
	(* This function gets two props and returns a prop c that is logicly equal *)
	(* to the prop "a XOR b" *)
		fun xor (a:prop, b:prop) = Or(And(Not a,b) ,And(a,Not b));
	(*c.*)
	(* This function prints the given prop to the terminal*)
		fun show (Atom a) = a |
			show (And(a:prop, b:prop)) = "("^show(a)^" & "^show(b)^")" |
			show (Or(a:prop, b:prop)) = "("^show(a)^" | "^show(b)^")" |
			show (Not(a:prop)) = "(~"^show(a)^")";
	(*d.*)
	(* This function gets a prop and returns the NNF of it   *)
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
	
	(*e.*)
	(* This function gets two CNF props and returns the CNF of "a || b"   *)
		fun distrib (p:prop, And(q:prop, r:prop)) = 
						And(distrib(p,q),distrib(p,r)) |
			distrib (And(q:prop, r:prop),p:prop) = 
						And(distrib(q,p),distrib(r,p)) |
			distrib (p:prop,q:prop) = Or(p,q);
			
	(*f.*)
	(* This function gets a NNF prop and returns a logicly eaual CNF prop*)
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
      (* This function determine if a big Or on literals is a tautology or not *)
        fun or_taut(Or(p,q), r) = or_taut(p,q) orelse or_taut(p,r) orelse or_taut(q,r)
        |   or_taut(p, Or(q,r)) = or_taut(p,q) orelse or_taut(p,r) orelse or_taut(q,r)
        |   or_taut(Atom(p), Not(Atom(q))) = (p = q)
        |   or_taut(Not(Atom(p)), Atom(q)) = (p = q)
        |   or_taut(p) = false; (* Atom, two Atoms, or Two Not(Atoms) *)
      in 
      (* Determine if a cnf is a tautology *)
        fun cnf_taut(Atom p)    = false
        |   cnf_taut(Not(p))    = false (* the input is CNF => p is an atom *)
        |   cnf_taut(And(p,q))  = cnf_taut(p) andalso cnf_taut(q)
        |   cnf_taut(Or(p,q))   = or_taut(p,q); 
      end;
    in
      (* determine if a prop is atautology *)
      fun taut(p) = cnf_taut(cnf(nnf(p)));
    end;


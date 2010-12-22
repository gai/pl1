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
	
	
	
	
	
	
		


	


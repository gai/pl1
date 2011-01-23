/* cuts */
p1(1).
p1(2):-!.
p1(3).
/* בתהליך החישוב של השאילתה מנסה פרולוג למצוא הצבה שתספק את X (נמצא אחד שכזה -> X=1). לאחר מכן משמעות סימן הקריאה הינו שמעתה ערכו של X לא ישתנה (לא יבוצע backtracking מנקודה זאת) ולאחר מכן מנסה פרולוג למצוא הצבה שתספק את Y וכמובן שגם כזאת נמצאת Y=1.									*/

/* 2 a */
/* ה-CUT בתכנית מספר אחת הינו GREEN CUT מכיון שהחוקים הינם זרים זה לזה ולכן אם מתקיים ש-X קטן משלוש התנאי השני ממילא לא מתקיים ולכן אין משמעות לכך שלא נאפשר את בדיקת התנאי השני.
לעומת זאת, בתכנית השנייה החוקים אינם זרים, ולכן גם אם מתקיים ש-X קטן משלוש יכולה להיות השמה שתספק את התוכנית בהתאם לחוק השני בלבד אך זה כלל אינו נבדק ברגע שמתקיים כי X קטן משלוש	 */
p2(X,Y):-X<3,!,Y=5.
p2(X,Y):-X>=3,Y=7.
/* */
/* 2 b */
p3(X,Y):-X<3,!,Y=5.
p3(X,Y):-Y=7.



/* 3 a */
/*	tree(1,tree(2,nil,nil),tree(3,nil,nil)).
	tree(a,
		tree(b,tree(d,nil,nil),tree(e,nil,nil)),
		tree(c,tree(f,nil,nil),tree(g,nil,nil))).		*/

binarytree(nil).
binarytree(tree(_,T1,T2)) :- (binarytree(T1),binarytree(T2)).
/* 
	binarytree(tree(1,nil,nil)).
	binarytree(tree(1,tree(1,nil,nil),nil)).
*/
full(tree(_,nil,nil)) :- !.
full(tree(_,T1,T2)) :- (full(T1),full(T2)).
/* 
	full(tree(1,nil,nil)).
	full(tree(1,tree(1,nil,nil),nil)).
	full(tree(1,tree(1,nil,nil),tree(1,nil,nil))).
*/


getnodesinorder(tree(W,nil,nil),X) :- X=W, !.
getnodesinorder(tree(W,T1,T2),X) :- getnodesinorder(T1,X) ; 
									W=X ;
									getnodesinorder(T2,X).
/* 
	getnodesinorder(tree(1,tree(2,nil,nil),tree(3,nil,nil)),X).
	getnodesinorder(tree(a,
					tree(b,tree(d,nil,nil),tree(e,nil,nil)),
					tree(c,tree(f,nil,nil),tree(g,nil,nil))),X).
*/


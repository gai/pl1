/* cuts */
p1(1).
p1(2):-!.
p1(3).
/* cuts 1 */

/* cuts 2 */
/* בתהליך החישוב של השאילתה מנסה פרולוג למצוא הצבה שתספק את X (נמצא אחד שכזה -> X=1). לאחר מכן משמעות סימן הקריאה הינו שמעתה ערכו של X לא ישתנה (לא יבוצע backtracking מנקודה זאת) ולאחר מכן מנסה פרולוג למצוא הצבה שתספק את Y וכמובן שגם כזאת נמצאת Y=1.									
*******************************************************************************/
/* cuts 3 */
/* ה-CUT בתכנית מספר אחת הינו GREEN CUT מכיון שהחוקים הינם זרים זה לזה ולכן אם מתקיים ש-X קטן משלוש התנאי השני ממילא לא מתקיים ולכן אין משמעות לכך שלא נאפשר את בדיקת התנאי השני.
לעומת זאת, בתכנית השנייה החוקים אינם זרים, ולכן גם אם מתקיים ש-X קטן משלוש יכולה להיות השמה שתספק את התוכנית בהתאם לחוק השני בלבד אך זה כלל אינו נבדק ברגע שמתקיים כי X קטן משלוש	 *******************************************************************************/


/* part #3 a */
/* this are the nouns as described
1.	tree(1,tree(2,nil,nil),tree(3,nil,nil)).
2.	tree(a,
		tree(b,tree(d,nil,nil),tree(e,nil,nil)),
		tree(c,tree(f,nil,nil),tree(g,nil,nil))).
*******************************************************************************/
/* part #3 b */
/* this predicate will return true iff it gets a binary tree or an empty one */
/* if it gets a tree that's not empty, it will check it's two sons			 */
binarytree(nil).
binarytree(tree(_,T1,T2)) :- (binarytree(T1),binarytree(T2)).
/* examples
	binarytree(tree(1,nil,nil)).
	binarytree(tree(1,tree(1,nil,nil),nil)).
*******************************************************************************/
/* part #3 c */
/* this predicate will return true iff it gets a full binary tree			*/
/* if it gets a tree that's not only a noun, it will check it's two sons	*/
full(tree(_,nil,nil)) :- !.
full(tree(_,T1,T2)) :- (full(T1),full(T2)).
/* examples
	full(tree(1,nil,nil)).
	full(tree(1,tree(1,nil,nil),nil)).
	full(tree(1,tree(1,nil,nil),tree(1,nil,nil))).
*******************************************************************************/
/* part #3 e */
/* this predicate will return al of the nouns that's in the tree inorder	*/
/* the order is defined from left to right - 								*/
/* 		the left son, then the noun and last will be the right son			*/
getnodesinorder(tree(W,nil,nil),X) :- W=X, !.
getnodesinorder(tree(W,T1,T2),X) :- getnodesinorder(T1,X) ; 
									W=X ;
									getnodesinorder(T2,X).
/* examples
	getnodesinorder(nil,X).
	getnodesinorder(tree(1,tree(2,nil,nil),tree(3,nil,nil)),X).
	getnodesinorder(tree(a,
					tree(b,tree(d,nil,nil),tree(e,nil,nil)),
					tree(c,tree(f,nil,nil),tree(g,nil,nil))),X).
*/


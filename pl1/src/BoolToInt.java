/* This function extends the sum function								*/
/* it receives an Integer and a Boolean and returns the next Integer if */
/* the Boolean is True or the previous Integer if the Boolean is False 	*/

public class BoolToInt extends SumFunction<Integer, Boolean> {
	public Integer op(Integer x, Boolean y) {
		return x + (y ? 1 : -1);
	}
}

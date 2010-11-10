/* This function extends the sum function								*/
/* it receives a Boolean and an Integer and returns their logical XOR	*/
/* a positive Integer will be True, any other will be False				*/

public class IntToBool extends SumFunction<Boolean, Integer> {
	private Boolean xor(Boolean x, Boolean y) {
		return ((x || y) && (! (x && y)));
	}
	
	public Boolean op(Boolean x, Integer y) {
		return xor(x, (y>0));
	}
}

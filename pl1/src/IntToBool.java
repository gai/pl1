
public class IntToBool extends SumFunction<Boolean, Integer> {
	private Boolean xor(Boolean x, Boolean y) {
		return ((x || y) && (! (x && y)));
	}
	
	public Boolean op(Boolean x, Integer y) {
		return xor(x, (y>0));
	}
}

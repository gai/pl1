
public class BoolToInt extends SumFunction<Integer, Boolean> {
	public Integer op(Integer x, Boolean y) {
		return x + (y ? 1 : -1);
	}
}

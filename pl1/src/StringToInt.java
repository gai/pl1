
public class StringToInt extends SumFunction<Integer, String> {
	public Integer op(Integer x, String y) {
		return x + y.length();
	}
}

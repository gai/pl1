/* This function extends the sum function								*/
/* it receives an Integer and a String and returns the sum of the		*/
/* Integer and the length of the string									*/

public class StringToInt extends SumFunction<Integer, String> {
	public Integer op(Integer x, String y) {
		return x + y.length();
	}
}

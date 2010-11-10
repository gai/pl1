/* This function extends the sum function								*/
/* it receives a String and a Character and returns their Concatenation	*/

public class CharToString extends SumFunction<String, Character> {
	public String op(String x, Character y) {
		return x+y;
	}
}

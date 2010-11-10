/* This function extends the sum function								*/
/* it receives an Integer and a Double and returns the sum of both	 	*/

public class IntToDouble extends SumFunction<Double, Integer> {
	public Double op(Double x, Integer y) {
		return x+y;
	}	
}

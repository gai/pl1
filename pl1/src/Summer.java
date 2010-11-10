/* This is the wrapper function.  											*/
/* It receives an array of inputs, a first element, the sum function to use */
/* for every iteration, and an array to set the output elements into		*/
/* the function operates the op function every iteration on the last 		*/ 
/* element and the next input element from the inArray						*/

public class Summer {
	public <X,Y> Y[] sum(X[] inArr, Y first, SumFunction<Y,X> f, Y[] outArr) {
		outArr[0] = f.op(first, inArr[0]);
		for (int i=1; i<outArr.length; ++i) {
			outArr[i] = f.op(outArr[i-1], inArr[i]);
		}
		return outArr;
	}
}

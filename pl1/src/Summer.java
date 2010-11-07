
public class Summer {
	public <X,Y> Y[] sum(X[] inArr, Y first, SumFunction<Y,X> f, Y[] outArr) {
		outArr[0] = f.op(first, inArr[0]);
		for (int i=1; i<outArr.length; ++i) {
			outArr[i] = f.op(outArr[i-1], inArr[i]);
		}
		return outArr;
	}
}

/* This function is the abstract function which all  */
/* specific sum functions will extend				*/

public abstract class SumFunction<Y,X> {
	public abstract Y op (Y y, X x);
}
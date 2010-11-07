
public class ExampleClass {
	static public void main(String[] args) {
		Integer[] inInt = {1,2,3,4};
		Boolean[] inBool = {true, true, false, false};
		String[] inString = {"Shrik Shrik", "Shrik Shrak", "bool", "La"};
		Character[] inChar = {'t', 'e', 's', 't'};
		
		Integer[] outInt = new Integer[4];
		Boolean[] outBool = new Boolean[4];
		String[] outString = new String[4];
		Double[] outDouble = new Double[4];
		
		Summer S= new Summer();
		
		System.out.println("Int to Double test -");
		outDouble = S.sum(inInt, 12.2, new IntToDouble(), outDouble);
		for (int i=0; i<outDouble.length; ++i) System.out.println(outDouble[i]);
		
		System.out.println("Int to Bool test -");
		outBool = S.sum(inInt, false, new IntToBool(), outBool);
		for (int i=0; i<outBool.length; ++i) System.out.println(outBool[i]);
		
		System.out.println("Bool to Int test -");
		outInt = S.sum(inBool, 42, new BoolToInt(), outInt);
		for (int i=0; i<outInt.length; ++i) System.out.println(outInt[i]);
		
		System.out.println("String To Int test -");
		outInt = S.sum(inString, 42, new StringToInt(), outInt);
		for (int i=0; i<outInt.length; ++i) System.out.println(outInt[i]);
		
		System.out.println("Char To String test -");
		outString = S.sum(inChar, "hey" , new CharToString(), outString);
		for (int i=0; i<outString.length; ++i) System.out.println(outString[i]);



	}
	
}

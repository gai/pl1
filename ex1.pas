// 065982415 somriguy@t2		036567055 gai@tx
{The main Idea of this code is to define the types of the step functions so	}
{the Sum functions could recieve it as a paramter					}
program q1;

uses Math, Sysutils;

{Types definitions for the step functions}
Type intToRealStep 		= function (x: Real		; y: Integer) :Real;
Type intToBoolStep 		= function (x: Boolean	; y: Integer) :Boolean;
Type boolToIntStep 		= function (x: Integer	; y: Boolean) :Integer;
Type stringToIntStep 	= function (x: Integer	; y: String	) :Integer;
Type charToStringStep 	= function (x: String	; y: char	) :String;


Type intArrT = array of Integer;
Type realArrT = array of Real;
Type stringArrT = array of String;
Type boolArrT = array of Boolean;


{This function receives an array of Integers, and returns an array of Reals}
function sumIntToReal(input_array: array of Integer; first: Real;
												f: intToRealStep) : realArrT;
	var
	i: integer;

	Begin
		setLength (sumIntToReal,high(input_array)+1);
		sumIntToReal[0] := f(first, input_array[0]);
		for i := 1 to high(input_array) do
			Begin
				sumIntToReal[i] := f(sumIntToReal[i-1], input_array[i]);
			End;
	End;


{This function receives an array of Integers, and returns an array of booleans}
function sumIntToBool(input_array: array of Integer; first: Boolean;
												f: intToBoolStep) : boolArrT;
	var
	i: integer;

	Begin
		setLength(sumIntToBool,high(input_array)+1);
		sumIntToBool[0] := f(first, input_array[0]);
		for i := 1 to high(input_array) do
			Begin
				sumIntToBool[i] := f(sumIntToBool[i-1], input_array[i]);
			End;
	End;



{This function receives an array of booleans, and returns an array of Integers}
function sumBoolToInt(input_array: array of Boolean; first: Integer;
												f: boolToIntStep) : intArrT;
	var
	i: integer;

	Begin
		setLength(sumBoolToInt,high(input_array)+1);
		sumBoolToInt[0] := f(first, input_array[0]);
		for i := 1 to high(input_array) do
			Begin
				sumBoolToInt[i] := f(sumBoolToInt[i-1], input_array[i]);
			End;
	End;


{This function receives an array of Strings, and returns an array of Integers}
function sumStringToInt(input_array: array of String; first: Integer;
												f: stringToIntStep) : intArrT;
	var
	i: integer;

	Begin
		setLength(sumStringToInt,high(input_array)+1);
		sumStringToInt[0] := f(first, input_array[0]);
		for i := 1 to high(input_array) do
			Begin
				sumStringToInt[i] := f(sumStringToInt[i-1], input_array[i]);
			End;
	End;


{This function receives an array of chars, and returns an array of Strings}
function sumCharToString(input_array: array of Char; first: String;
												f: charToStringStep) : stringArrT;
	var
	i: integer;

	Begin
		setLength(sumCharToString,high(input_array)+1);
		sumCharToString[0] := f(first, input_array[0]);
		for i := 1 to high(input_array) do
			Begin
				sumCharToString[i] := f(sumCharToString[i-1], input_array[i]);
			End;
	End;


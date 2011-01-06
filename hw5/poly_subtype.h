#ifndef POLY_SUBTYPE_H
#define POLY_SUBTYPE_H
#include <iostream>
using std::cout;
using std::endl;

//Deriving classes definition
class IntClass;
class DoubleClass;

//The Virtual Number Class. IntClass and FloatClass will derive from this class.
class Number {
    public:
        //return a Number object that's the results of x+this, when x is DoubleClass
        virtual Number& addDouble(DoubleClass& x) = 0;
        
        //return a Number object that's the results of x+this, when x is IntClass
        virtual Number& addInt(IntClass& x) = 0;
        
        //return a Number object that's the results of x+this, when x is either
        //IntClass or DoubleClass
        virtual Number& operator+(Number& x) = 0;
        
        //Print the number stored in the object
        virtual void print_number() = 0;        
};

class IntClass : public Number {
    private:
        int my_number;
    public:
        //Constructor
        IntClass(int n):my_number(n) {}
        
        //returns the number stored in the object
        int get_number()  {return my_number;}
        
        //print the number stored in the object
        void print_number() {cout << my_number << endl;}
        
        //return a DoubleClass object that's the result of x+this
        Number& addDouble(DoubleClass& x);
        
        //return an IntClass object that's the result of x+this
        Number& addInt(IntClass& x);
        
        //return a Number object that's the result of x+this.
        //The actual class of the returned object depends on x.
        //If x is IntClass, then the result if IntClass.
        //If x is DoubleClass, then the results is DoubleClass.
        Number& operator+(Number& x);
};

class DoubleClass : public Number {
    private:
        double my_number;
    public:
        //Constructor
        DoubleClass(double n):my_number(n) {}
        
        //returns the number stored in the object
        double get_number()  {return my_number;}
        
        //Print the number stored in the object
        void print_number() {cout << my_number << endl;}
        
        //return a DoubleClass object that's the result of x+this
        Number& addDouble(DoubleClass& x);
        
        //return a DoubleClass object that's the result of x+this
        Number& addInt(IntClass& x);
        
        //return a DoubleClass object that's the result of x+this.
        //This should work if x is either IntClass or DoubleClass
        Number& operator+( Number& x);
};

#endif

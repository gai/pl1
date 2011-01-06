#include "poly_subtype.h"
#include "q3.h"
#include <iostream>
using std::cout;
using std::endl;


int main() {    
    int i = 0;
    double d = 0;
    
    //Test coercion polymorphism
    cout << "Testing coercion polymorphism:" << endl;
    i = add_coercion(2,3); cout << i << ", ";
    d = add_coercion(2,3.1); cout << d << ", ";
    d = add_coercion(2.1,3); cout << d << ", ";
    d = add_coercion(2.1,3.1); cout << d << endl;
    //expected output:5, 5.1, 5.1, 5.2
    
    //Test overloading polymorphism
    cout << "Testing overloading polymorphism:" << endl;
    i = add_overload(2,3); cout << i << ", ";
    d = add_overload(2,3.1); cout << d << ", ";
    d = add_overload(2.1,3); cout << d << ", ";
    d = add_overload(2.1,3.1); cout << d << endl;
    //expected output:5, 5.1, 5.1, 5.2
    
    //Test parametric polymorphism
    cout << "Testing parametric polymorphism:" << endl;
    i = add_parametric<int,int,int>(2,3); cout << i << ", ";
    d = add_parametric<double,int,double>(2.1,3); cout << d << ", ";
    d = add_parametric<int,double,double>(2,3.1); cout << d << ", ";
    d = add_parametric<double,double,double>(2.1,3.1); cout << d << endl;
    //expected output:5, 5.1, 5.1, 5.2
    
    //Test subtyping polymorphism
    cout << "Testing subtyping polymorphism:" << endl;
    IntClass ic(2);
    DoubleClass fc(2.4);    
    Number& num = ic+ic;     num.print_number();  //should be: 4
    Number& num2 = fc+fc;    num2.print_number(); //should be: 4.8
    Number& num3 = num+num2; num3.print_number(); //should be: 8.8
}

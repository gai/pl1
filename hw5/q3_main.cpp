#include "poly_subtype.h"
#include "q3.h"
#include <iostream>
#include <climits>
using std::cout;
using std::endl;


int main() {
  cout << "Testing coercion polymorphism:" << endl;
  cout << add_coercion(1, 1) << endl;
  cout << add_coercion(1.1, 1.1) << endl;
  cout << add_coercion(1, 1.1) << endl;
  cout << add_coercion(1.1, 1) << endl;
  cout << add_coercion(INT_MAX, 1) << endl;

  cout << "Testing overload polymorphism:" << endl;
  cout << add_overload(1, 1) << endl; 
  cout << add_overload(1, INT_MAX) << endl;
  cout << add_overload(1, 1.1) << endl;
  cout << add_overload(INT_MAX, 1.1) << endl;
  cout << add_overload(1.1, 1) << endl;
  cout << add_overload(1.1, INT_MAX) << endl;
  cout << add_overload(1.1, 1.1) << endl;

  cout << "Testing template polymorphism:" << endl;  
  cout << add_parametric<int, int, int>(1, 1) << endl;
  cout << add_parametric<int, int, int>(INT_MAX, 1) << endl;
  cout << add_parametric<double, int, double>(INT_MAX,1.0) << endl;
  cout << add_parametric<int, double, double>(1.1,1.1) << endl;
  cout << add_parametric<double, double, double>(1.1,1.1) << endl;
  cout << add_parametric<double, float, float>(12.1,13.2) << endl;
  
  cout << "Testing IntClass DoubleClass:" << endl;  
  IntClass i(1), maxint(INT_MAX);
  DoubleClass d(1.1);
  Number& num1 = i+i;         num1.print_number();  
  Number& num2 = i+maxint;    num2.print_number();  
  Number& num3 = i+d;         num3.print_number();  
  Number& num4 = d+i;         num4.print_number();  
  Number& num5 = d+d;         num5.print_number();  
  Number& num6 = d+maxint;    num6.print_number();  
  return 0;
}

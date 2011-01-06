#include "cpu_add.h"
#include "poly_subtype.h"

double add_coercion(double a, double b) {
  return add_double_double(a, b);
}

int add_overload(int a, int b) {
  return add_int_int(a, b);
}

double add_overload(int a, double b) {
  return add_int_double(a, b);
}

double add_overload(double a, int b) {
  return add_int_double(b, a);
}

double add_overload(double a, double b) {
  return add_double_double(a, b);
}


template <class A, class B, class RET>
RET add_parametric(A a, B b) {
  return static_cast<RET>(add_double_double(static_cast<double>(a), static_cast<double>(b)));
}

template <>
int add_parametric<int, int, int>(int a, int b) {
  return add_int_int(a, b);
}

//return a DoubleClass object that's the result of x+this
Number& IntClass::addDouble(DoubleClass& x) {
  DoubleClass *d = new DoubleClass(add_int_double(my_number, x.get_number()));
  return *d;
}

//return an IntClass object that's the result of x+this
Number& IntClass::addInt(IntClass& x) {
  IntClass *i = new IntClass(add_int_int(my_number, x.get_number()));
  return *i;
}

//return a Number object that's the result of x+this.
//The actual class of the returned object depends on x.
//If x is IntClass, then the result if IntClass.
//If x is DoubleClass, then the results is DoubleClass.
Number& IntClass::operator+(Number& x) {
  return x.addInt(*this);
}

//return a DoubleClass object that's the result of x+this
Number& DoubleClass::addDouble(DoubleClass& x) {
  DoubleClass *d = new DoubleClass(add_double_double(my_number, x.get_number()));
  return *d;
}

//return a DoubleClass object that's the result of x+this
Number& DoubleClass::addInt(IntClass& x) {
  DoubleClass *d = new DoubleClass(add_int_double(x.get_number(), my_number));
  return *d;
}

//return a DoubleClass object that's the result of x+this.
//This should work if x is either IntClass or DoubleClass
Number& DoubleClass::operator+( Number& x) {
  return x.addInt(*this);
}


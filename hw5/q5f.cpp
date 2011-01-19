template <class T, int i> class foo {
public :
    T bar[i];
};

template <class T, class S> class foo {
 public :
  T bar1;
  S bar2;
};

int main() {
  foo<int, 3> i;
  foo<double, int> d;
  return 0;
}

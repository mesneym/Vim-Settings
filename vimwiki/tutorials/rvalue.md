# Rvalue Reference

## Move Semantics


## Perfect Forwarding
```cpp
  
  void foo(boVetor arg);
  //boVector has both move constructor and copy constructor
  
  
  template < typename T>
  void relay(T arg)
  {
   foo(arg);
  }


  int main()
  {
    boVector reusable = createBoVector();
    relay(reusable);
    
    relay(createBoVector());
  }
  
  
  /* Requirements
  * 1. No costly and unnecessary copy construction of boVector is made
  * 2. rvalue is forwared as rvalue, and lvalue is forwarded as lvalue
  *
  *
  * Question? How do we achieve this with templates 
  */
  
  
  //Solution
  template<typename T>
  void relay(T&& arg)
  {
    foo(std::forward<T>(arg));
  }
  //Note this will work because type T is a template type
  
```
### Reference Collapsing rules (c++ 11)
T& &   => T& \
T& &&  => T&  \
T&& &  => T& \
T&& && => T&&

### Remove Reference
```cpp
template<class T> 
struct remove_reference;

std::remove_reference<int>::type is int? true
std::remove_reference<int&>::type is int? true
std::remove_reference<int&&>::type is int? true
std::remove_reference<const int&>::type is const int? true
```

### Understanding  Perfect Forwarding(Type Deductions)
```cpp
template< typname T>
void relay(T&& arg)
{
  ...
}
/* rvalue reference is specified with type &&
 * type&& is rvalue reference?
 *
 */
 
 //T&& variable is initialized with rvalue => rvalue reference
 relay(9); => T = int&& => T&& = int && && = int &&
 
 //T&& variable is initialized with lvalue => lvalue reference
 relay(x); => T = int& => T&& = int & && = int&
 
 /* && is Universal Reference: rvalue,lvalue, const, non-const, etc...
  * Conditions:
  * 1. T is a template type.
  * 2. Type deduction(reference collasing) happens to T.
      - T is a function template type, not class template type.
  
  otherwise && is rvalue reference


template< typename T>
void relay(T&& arg)
{
  foo(std::forward<T>(arg));
}

//implementation of std::forward()
T&& forward(typename remove_reference<T>::type& arg)
{
  return static_cast<T&&>(arg);
}
```

### Difference between std::forward and std::move
std::move<T>(arg); //Turns arg into an rvalue type
std::forward<T>(arg); //Turns arg to type T&&


## Usage of rvalue reference 
1. Move Semantics
2. Perfect forwarding 

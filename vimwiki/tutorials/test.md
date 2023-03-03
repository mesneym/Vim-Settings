# What are unit test
Purpose is to test functionality of system.Whether code is working as expected or not and 
not to find bugs that exist in code. 

**Unit**\
For testing depends upon individiual programmers
 * 1...n functions / 1...n objects
 * capable of executing independently 
 
**Writing Unit Test**\
Arrange- Act - Assert(AAA)
```
int sum(int a, int b)
{
  return a+ b
}

TEST(SUM_TEST, test_1)
{
  //Arrange
  int first_value = 100, Second_value = 200;
  //Act
  int result = Sum(first_value, Second_value);
  //Assert 
  ASSERT_EQ(result, (first_value+second_value));
}

```
  
**Test Doubles**\
Used for external dependencies
* [Mocks](Mocks.md) 
replaces external interface
```
 int MyFunction()
   socket.connect(ip)
  
 Mock()
   socket.connect(ip)
```
Mocks are not used for checking behavior of function or return values from function call. 
  It is used for 
  * checking if Mock function is called or not 
  * How many times it gets called
  * What parameters are passed when it was called. 
summary - right call, right number of times with right set of parameters

* Stubs
similar to mock but generates predefined outputs
```
  Stub()
    socker.connect(ip)
```
  * returns success failure or exceptions(as coded)
  * checks the behavior of code under test in case of return values 
  

* Fakes
 Almost working implementation
 ```
  Fake()
    socket.connect(ip)
 ```
 * instead of actually going to internet it connects to local(limited) implementation
 * check the behavior with respect to actual data it receives from the server



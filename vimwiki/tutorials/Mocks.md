Mocking 

# Dependency Injection
Production\
&emsp;   Unit Under Test -> Dependency
Test\
&emsp;   Unit Under Test -> Mock
   
Generally we want code to be loosely coupled to its dependency so that Dependency can be replaced with mock. Always opt for
**inversion of control approach**
   * Dependencies are injected 
   * Configuration injected
   * Lifecycle maintained from outside


Example 
```
struct Motor{
  virtual ~Motor() = default;
  virtual int getSpeed() =0;
  virtual void stop() = 0;
}

class Car{
  public:
    Car(Motor &motor): mMotor(motor) {}
    
    void controlSpeed(){
      if(mMotor.getSpeed()> 50)
      {
        mMotor.stop();
      }
    }
  private:
    Motor & mMotor;
};


//Production Implementation
struct DcMotor: public Motor
{
  int getSpeed() override;
  void stop() override;
};


//Mock Implementation
struct MockMotor :public Motor
{
  MOCK_METHOD(int ,getSpeed, () , (override));
  MOCK_METHOD(void, stop, (), (override));
}


//Using google mock framework
TEST(CarTest, controlSpeedWhenSpeedTooHighWillStop)
{
  MockMotor motor;
  Car car(motor);
  EXPECT_CALL(motor, getSpeed()).WillOnce(Return(100))
  EXPECT_CALL(motor,stop());
  car.controlSpeed();
}

TEST(CarTest, controlSpeedWhenSpeedLowWillNotStop)
{
  MockMotor motor;
  Car car(motor);
  EXPECT_CALL(motor, getSpeed()).WillOnce(Return(49));
  EXPECT_CALL(motor,stop()).Times(0);
  car.controlSpeed();
}

```

## What if Dependency injection is not Possible
Why DI might not be suitable in certain cases
* Simplicity
* Performance from virtual functions    
* Cannot change API(legacy code) 

Static Mocks





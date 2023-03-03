## Introduction 
A way to map **commands** to **rules/targets** and **link** rules with their **dependencies**  

For example
```
all: clean test          #rule -- all | dependencies --clean and test. Therefore, clean and test rules are executed
  
clean:
  rm -f test *.o

test1:
  g++ test.cpp -c -o test1.o

test:test1               #rule -- test | dependencies -- test1. test1 rule is executed first proceeds to next instruction 
  g++ test1.o -o test
```

### PHONY target
Make assumes that targets are files. In the above example, **test1** is associated with file generated from **command**. 
Suppose we had a file called clean and we run **make clean**, because  **clean** file already exist, the command will be skipped.
Therefore we add .PHONY to tell make that clean does not represent a physical file.
```
.PHONY: clean all
clean:
  rm -f test *.o
```




# String Stream
```cpp
stringstream ss; //Stream without IO operation
//read/write of string 

ss<< 89 << "Hex:" << hex << 89 << " Oct: " << oct << 89;
cout << ss.str() << endl; //89 Hex:59 Oct:131

int a, b, c;
string s1;

ss >> hex >> a; //Formated input works toke by token. spaces, tabs, newlines
      a == 137
ss >> s1;  // s1: "Hex:"
ss >> dec >> b; // b==59
ss.ignore(6);

ss >> oct >> c; // c==89

ostringstream -- formated output
istringstream -- formated input
sstringstream -- both input and output
```

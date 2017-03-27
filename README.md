# Recursion Problems

## Definitions
Define the following:

- Recursion
  --see recursion; when a method calls itself
- Recursive Case
  --the case where the recursion will be called
- Base Case
  --the case that stops the recursion
- Activation Chain/Stack
  --the process of stepping through the recursion
- Activation Record/Call
  --an individual step in the activation chain
- Infinite Recursion/Stack Overflow/Stack too deep
  --never reaching the base case--the error that gets raised
- Tail Recursion

## Tracing through a recursive method

### Trace #1
```
def mystery1(n)
  if n == 1
    return n
  else
    return n + mystery1(n-1)
  end
end
```

- What is mystery1(5)?  
>   mystery1(5) = 15  
    m(5) = 5 + m1(4) --> 15  
    m(4) = 4 + m1(3) --> 10  
    m(3) = 3 + m1(2) --> 6  
    m(2) = 2 + m1(1) --> 3  
    m1(1) = 1
- What is mystery1(10)?
> mystery1(10)= 55  
  m1(10) = 10 + m1(9) --> 55  
  m1(9) = 9 + m1(8) --> 45  
  m1(8) = 8 + m1(7) --> 36    
  m1(7) = 7 + m1(6) --> 28  
  m1(6) = 6 + m1(5) -> 21  
  m1(5) = 5 + m1(4) -> 15  
  m1(4) = 4 + m1(3) -> 10  
  m1(3) = 3 + m1(2) -> 6  
  m1(2) = 2 + m1(1) -> 3   
  m1(1) = 1
- What is mystery1(0)?
> m1(0) --> returns stack too deep error because base case of n == 1 is never met

### Trace #2
```
def mystery2(n)
  if n < 10
    return n
  else
    return (n%10) + mystery2(n/10)
  end
end
```

- What is mystery2(123)?
>mystery2(123) = 6  
  m2(123) = 3 + m2(12) --> 6  
  m(12) = 2 + m2(1) --> 3  
  m(1) = 1
- What is mystery2(9005)?
>mystery2(9005) = 14  
  m2(9005) = 5 + m2(900) --> 14  
  m2(900) = 0 + m2(90) --> 9  
  m2(90)= 0 + m2(9) --> 9  
  m2(9) = 9
- What is mystery2(-123)?
>mystery2(-123) = -123  
  m2(-123) = -123
- _Added Fun: How could we make `mystery2(-123)` work the way we might expect it to work instead of the way it does?_
>make the first part of the conditional check if a negative number is greater than -10 and a pos. number is less than ten. i think division would need to return positive values (i.e. -123/10 should return 12 not -12), or be converted to a pos value.

### Trace #3
```
def mystery3(n)
  if n == 0
    return 100
  elsif n == -1
    return 200
  end
  if n%2 == 0
    return mystery3(n/2)
  else
    return mystery3(n-1)
  end
end
```

- What is mystery3(1)?
>mystery3(1) = 100  
  m3(1) = m3(0) --> 100  
  m3(0) = 100
- What is mystery3(13)?   
  mystery3(13) = 100    
  m3(13) = m3(12) --> 100  
  m3(12) = m3(6) --> 100  
  m3(6) = m3(3) --> 100  
  m3(3) = m3(2) --> 100  
  m3(2) = m3(1) --> 100  
  m3(1) = 100
- What is mystery3(-6)?
>mystery3(-6) = 200  
m3(-6) = m3(-3) --> 200  
m3(-3) = m3(-4) --> 200  
m3(-4) = m3(-2) --> 200  
m3(-2) = m3(-1) --> 200  
m3(-1) = 200

### Trace #4
```
def mystery4(b,e)
  if e == 0
    return 1
  else
    return b * mystery4(b,e-1)
  end
end
```

- What is mystery4(10,2)?
>mystery4(10,2) = 100  
m4(10,2) = 10 * m4(10,1) --> 100  
m4(10,1) = 10 * m4(10,0) -->10  
m4(10,0) = 1

- What is mystery4(4,3)?
>mystery4(4,3) = 64  
m4(4,3) = 4 * m4(4,2) --> 64  
m4(4,2) = 4 * m4(4,1) --> 16  
m4(4,1) = 4 * m4(4,0) --> 4  
m4(4,0) = 1
- What is mystery4(5,0)?

### Trace #5
```
def mystery5(s)
  if s.length == 0
    return ""
  else
    return "*" + mystery5(s[1..-1])
  end
end
```

- What is mystery5("hi")?
>mystery5("hi") = string of two asterisks  
m5("hi") = "*" + m5("i") --> string of two asterisks  
m5("i") = "*" + m5("") --> "*"  
m5("") = ""  

- What is mystery5("")?
>m5("") = ""
- What is mystery5("Hi, there!")?
>m5("Hi, there!") = "*" + m5("i, there!") --> string of 10 asterisks  
m5("i, there!") = "*" + m5(", there!") --> string of 9 asterisks  
m5(", there!") = "*" + m5(" there!") --> string of 8 asterisks  
m5(" there!") = "*" + m5("there!") --> string of 7 asterisks   
m5("there!") = "*" + m5("here!") --> string of 6 asterisks   
m5("here!") = "*" + m5("ere!") --> string of 5 asterisks   
m5("ere!") = "*" + m5("re!") --> string of 4 asterisks   
m5("re!") = "*" + m5("e!") --> string of 3 asterisks   
m5("e!") = "*" + m5("!") --> string of 2 asterisks   
m5("!") = "*" + m5("") --> "*"  
m5("") = ""

- _Added Fun: How could we make only alphabetic characters to be changed to stars?_

### Trace #6
```
def mystery6(s)
  if s == nil || s.length == 0
    return ""
  else
    space = 0
    until space >= s.length || s[space] == " "
      space += 1
    end
    return mystery6(s[(space+1)..-1]) + " " + s[0...space]
  end
end
```

- What is mystery6("goodnight moon")?

- What is mystery6("Ada Developers Academy")?
- What is mystery6("Hi, there!")?
- _Added Fun: How could we make the reversal happen by letter, instead of by word (i.e. Make it so that mystery6("goodnight moon") returned "noom thgindoog")?_

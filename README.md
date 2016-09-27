# Recursion Problems

## Definitions
- Recursion
- Recursive Case
- Base Case
- Activation Chain/Stack
- Activation Record/Call
- Infinite Recursion/Stack Overflow/Stack too deep
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
- What is mystery1(10)?
- What is mystery1(0)?

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

- What is mystery2(123)? **3 + 2 + 1 = 6 ([Panopto](https://adaacademy.hosted.panopto.com/Panopto/Pages/Viewer.aspx?id=202b1920-9501-4fd3-ae41-7b35a50166ff) at 45:00)**
- What is mystery2(9005)? **5 + 0 + 0 + 9 = 14 ([Panopto](https://adaacademy.hosted.panopto.com/Panopto/Pages/Viewer.aspx?id=202b1920-9501-4fd3-ae41-7b35a50166ff) at 45:00)**
- What is mystery2(-123)?
- _Added Fun: How could we make `mystery2(-123)` work the way we might expect it to work instead of the way it does?_

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
- What is mystery3(13)? **100 ([Panopto](https://adaacademy.hosted.panopto.com/Panopto/Pages/Viewer.aspx?id=202b1920-9501-4fd3-ae41-7b35a50166ff) at 1:09:00)**
- What is mystery3(-6)? **200 ([Panopto](https://adaacademy.hosted.panopto.com/Panopto/Pages/Viewer.aspx?id=202b1920-9501-4fd3-ae41-7b35a50166ff) at 1:09:00)**

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
- What is mystery4(4,3)?
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
- What is mystery5("")?
- What is mystery5("Hi, there!")?
- _Added Fun: How could we make only alphabetic characters to be changed to stars?_

## Writing a recursive method

### Write #1
`factorial(n)`
Write a method `factorial` that accepts an integer parameter n and that uses recursion to compute and return the value of n factorial (also known as n!).

- e.g. fact(4) = 4 * 3 * 2 * 1 = 24

### Write #2
`reverse(s)`
Write a method `reverse` that accepts a string as a parameter
and then returns the reverse of the string.

- e.g. reverse("hello") = "olleh"

### Write #3
`bunny(n)`
Write a method `bunny` that accepts an integer parameter n. N represents a
number of bunnies and each bunny has two big floppy ears. We want to compute the total number of ears across all the bunnies recursively (without loops or multiplication).

- e.g. bunny(0) = 0
- e.g. bunny(1) = 2
- e.g. bunny(10) = 20

### Write #4
`nested(s)`
Write a method `nested` that accepts a string of only parenthesis
and then returns if those parenthesis are properly nested. You may
assume that no non-paren characters will be passed to this method.

- e.g. nested("((()))") = true
- e.g. nested("())") = false





## More Added Fun (optional)

### fib(n)
Write a recursive method `fib` that accepts an integer n as a parameter and returns the nth [fibonacci number](https://en.wikipedia.org/wiki/Fibonacci#Fibonacci_sequence).

- e.g. fib(4) = (1 1 2) 3 = 3

### pal(s)
Write a recursive method `pal` that accepts a string s as a parameter and returns a boolean value indicating if that string is a [palindrome](https://en.wikipedia.org/wiki/Palindrome) or not.

- e.g. pal("racecar") = true
- e.g. pal("smile") = false

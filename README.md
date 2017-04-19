# Recursion Problems

## Definitions
Define the following:

- Recursion: a function in that iterates on itself
- Recursive Case: an input (in a recursion) that returns something that calls itself
- Base Case: an input (in a recursion) that produces an output that is not recursive--needs at least one to not be an infinite loop
- Activation Chain/Stack: the entire run of the function--from first recursive case to base case
- Activation Record/Call: each iteration of the function
- Infinite Recursion/Stack Overflow/Stack too deep: base case cannot be reached by the input so there's an infinite loop
- Tail Recursion: the final output is reflected in the output of each activation record

## Tracing through a recursive method

### Trace #1
```ruby
def mystery1(n)
  if n == 1
    return n
  else
    return n + mystery1(n-1)
  end
end
```

- What is mystery1(5)?
```
n=5 | 5 + m(4)
n=4 | 4 + m(3)
n=3 | 3 + m(2)
n=2 | 2 + m(2)
n=1 | 1
5+(4+(3+(2+(1))))
returns 15
```
- What is mystery1(10)?
```
n=10 | 10 + m(9)
n=9 | 9 + m(8)
n=8 | 8 + m(7)
n=7 | 7 + m(6)
n=6 | 6 + m(5)
n=5 | returns 15 (from above)
10+(9+(8+(7+(6+(15)))))
returns 55
```
- What is mystery1(0)?
```
n= 0 | 0 + m(0)
n=-1 | -1 + m(-1)
n=-2 | -2 + m(-2)
...
infinite recursion
```

### Trace #2
```ruby
def mystery2(n)
  if n < 10
    return n
  else
    return (n%10) + mystery2(n/10)
  end
end
```

- What is mystery2(123)?
```
n=123 | 3 + m(12)
n=12 | 2 + m(1)
n=1 | 1
3+(2+(1))
returns 6
```
- What is mystery2(9005)?
```
n=9005 | 5 + m(900)
n=900 | 0 + m(90)
n=90 | 0 + m(9)
n=9 | 9
5+(0+(0+(9)))
returns 14
```
- What is mystery2(-123)?
```
n= -123
returns -123
```
- _Added Fun: How could we make `mystery2(-123)` work the way we might expect it to work instead of the way it does?_ ANSWER: change base case conditional to absolute value < 10 OR % by 1000 < 10

### Trace #3
```ruby
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
```
n=1 | m(0)
n=0 | 100
returns 100
```
- What is mystery3(13)?
```
n=13 | m(12)
n=12 | m(6)
n=6 | m(3)
n=3 | m(2)
n=2 | m(1)
n=1 | m(0)
n=0 | 100
returns 100
```
- What is mystery3(-6)?
```
```

### Trace #4
```ruby
def mystery4(b,e)
  if e == 0
    return 1
  else
    return b * mystery4(b,e-1)
  end
end
```

- What is mystery4(10,2)?
```
```
- What is mystery4(4,3)?
```
```
- What is mystery4(5,0)?
```
```

### Trace #5
```ruby
def mystery5(s)
  if s.length == 0
    return ""
  else
    return "*" + mystery5(s[1..-1])
  end
end
```

- What is mystery5("hi")?
```
```
- What is mystery5("")?
```
```
- What is mystery5("Hi, there!")?
```
```
- _Added Fun: How could we make only alphabetic characters to be changed to stars?_

### Trace #6
```ruby
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
```
```
- What is mystery6("Ada Developers Academy")?
```
```
- What is mystery6("Hi, there!")?
```
```
- _Added Fun: How could we make the reversal happen by letter, instead of by word (i.e. Make it so that mystery6("goodnight moon") returned "noom thgindoog")?_

### Trace #7
```ruby
def mystery7(word)
  if word.length < 2
    return true
  elsif word[0] != word[-1]
    return false
  else
    return mystery7(word[1..-2])
  end
end
```

- What is mystery7("cupcake")?
- What is mystery7("detected")?
- What is mystery7("eye")?

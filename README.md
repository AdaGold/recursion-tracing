# Recursion Problems

## Definitions
Define the following: 

- Recursion: A method that calls itself
- Recursive Case: The part of a method that is recursive (calls itself)
- Base Case: The case that stops the loop
- Activation Chain/Stack: The process of solving the recursive loop
- Activation Record/Call: Each complete step in Activation Stack
- Infinite Recursion/Stack Overflow/Stack too deep: A recursive method without a base case, or one where the starting value bypasses the base case, will continue indefinitely until stopped by the computer for taking up too much memory/room.
- Tail Recursion: Is a special type of problem where the recursive call is the last part of the function.

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
15
- What is mystery1(10)?
55
- What is mystery1(0)?
Infinite recursion!!
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
6
- What is mystery2(9005)?
14
- What is mystery2(-123)?
123
- _Added Fun: How could we make `mystery2(-123)` work the way we might expect it to work instead of the way it does?_

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
100
- What is mystery3(13)?
100
- What is mystery3(-6)?

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
- What is mystery4(4,3)?
- What is mystery4(5,0)?

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
- What is mystery5("")?
- What is mystery5("Hi, there!")?
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
- What is mystery6("Ada Developers Academy")?
- What is mystery6("Hi, there!")?
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

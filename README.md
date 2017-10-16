# Reference solution for recursion tracing
## Definitions
Define the following:

- **Recursion**: Recursion occurs when a thing is defined in terms of itself or of its type. A **recursive method** is a method that calls itself. A **recursive algorithm** is a solution that is expressed in terms of (a) smaller instances of itself and (b) a base case.
- **Recursive Case**: The case for which the solution is expressed in terms of smaller version of itself. This is the part of the method where the recursion occurs.
- **Base Case**: The case for which the solution can be stated non-recursively. This is the case which stops the recursive calls. At least one base case is required to ensure that there isn't infinite recursion.
- **Activation Chain/Function Call Stack**: Sequence of individual function calls or records, usually nested. The whole chain of events that happen in a recursive method will form one activation chain. Each individual record takes up space in the stack memory when the program is running.
- **Activation Record/Function Call**: The separate pieces of the Activation Chain. Every function call results in a record getting created in the stack memory.
- **Infinite Recursion/Stack Overflow/Stack too deep**: An **infinite recursion** occurs when a base case is never met. This results in repeated recursive calls taking up more and more of the stack space. Eventually, the program runs out of stack memory, which results in **stack overflow**.
- **Tail recursion**: A recursive approach where the computations are done first and the very last thing in the function is a recursive call, the results of which are immediately returned. For example consider the following recursive algorithm:
```ruby
def natural_numbers_sum(num)
  if num == 0 # base case
    return 0
  end
  # recursive case
  return num + natural_numbers_sum(num - 1)
end
```
Here's the **tail recursion** version of the above recursive algorithm:
```ruby
# using tail recursion
def natural_numbers_sum(num, sum=0)
  if num == 0 # base case
    return sum
  end
  # recursive case
  return natural_numbers_sum(num - 1, sum + num)
end
```
In the first approach, after a nested recursive call returns, the value returned needs to be added to num before the current stack frame returns. This is not the case with the second approach leveraging tail recursion. 

Notice that in the second version above, the version employing tail recursion, the return value of any given recursive step is the same as the return value of the next recursive call. After a nested recursive call returns, there is no additional computation needed in recursive approach using tail recursion. This allows for compiler optimizations provided in specific languages to kick in and reduces the chances of stack overflow.

Optional further reading: https://www.quora.com/What-is-tail-recursion-Why-is-it-so-bad

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

- What is mystery1(5)?</br>
m1(5) = 5 + m1(4) = **15**</br>
m1(4) = 4 + m1(3) = 10</br>
m1(3) = 3 + m1(2) = 6</br>
m1(2) = 2 + m1(1) = 3</br>
m1(1) = 1</br>

- What is mystery1(10)?</br>
m1(10) = 10 + m1(9) = **55**</br>
m1(9) = 9 + m1(8) = 45</br>
m1(8) = 8 + m1(7) = 36</br>
m1(7) = 7 + m1(6) = 28</br>
m1(6) = 6 + m1(5) = 21</br>
m1(5) = 5 + m1(4) = 15</br>
m1(4) = 4 + m1(3) = 10</br>
m1(3) = 3 + m1(2) = 6</br>
m1(2) = 2 + m1(1) = 3</br>
m1(1) = 1</br>

- What is mystery1(0)?</br>
**"Stacked too deep" / infinite recursion**

- What is the time complexity of mystery1(n)?</br>
O(n) Since n steps will be needed to calculate mystery1(n).

- What is the space complexity of mystery1(n)?</br>
O(n) Since n stack frames will be needed to reach the base case for this recursive method.

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

- What is mystery2(123)?</br>
m2(123) = 3 + m2(12) = **6**</br>
m2(12) = 2 + m2(1) = 3</br>
m2(1) = 1

- What is mystery2(9005)?</br>
m2(9005) = 5 + m2(900) = **14**</br>
m2(900) = 0 + m2(90) = 9</br>
m2(90) = 0 + m2(9) = 9</br>
m2(9) = 9

- What is mystery2(-123)?</br>
m2(-123) = **-123**

- What is the time complexity of mystery2(n)?</br>
O(k) where k is the number of digits in n. k will be close to log (base 10) of n. Try this out with a scientific calculator.

- What is the space complexity of mystery2(n)?</br>
O(k) where k is the number of digits in n. k will be close to log (base 10) of n. There will be k number of stack frames in the activation chain.

- _Added Fun: How could we make `mystery2(-123)` work the way we might expect it to work instead of the way it does?_</br>
See added_fun_solutions.rb

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

- What is mystery3(1)?</br>
m3(1) = m3(0) = **100**</br>
m3(0) = 100

- What is mystery3(13)?</br>
m3(13) = m3(12) = **100**</br>
m3(12) = m3(6) = 100</br>
m3(6) = m3(3) = 100</br>
m3(3) = m3(2) = 100</br>
m3(2) = m3(1) = 100</br>
m3(1) = m3(0) = 100</br>
m3(0) = 100

- What is mystery3(-6)?</br>
m3(-6) = m3(-3) = **200**</br>
m3(-3) = m3(-4) = 200</br>
m3(-4) = m3(-2) = 200</br>
m3(-2) = m3(-1) = 200</br>
m3(-1) = 200

- What is the time complexity of mystery3(n)?</br>
Approximately, O(abs(n)/2) where abs(n) gives the absolute value for n (postive version of the same value).

- What is the space complexity of mystery3(n)?</br>
Approximately, O(abs(n)/2) where abs(n) gives the absolute value for n (postive version of the same value).

### Trace #4
```ruby
def mystery4(b, e)
  if e == 0
    return 1
  else
    return b * mystery4(b, e-1)
  end
end
```

- What is mystery4(10, 2)?</br>
m4(10, 2) = 10 * m4(10, 1) = **100**</br>
m4(10, 1) = 10 * m4(10, 0) = 10</br>
m4(10, 0) = 1

- What is mystery4(4, 3)?</br>
m4(4, 3) = 4 * m4(4, 2) = **64**</br>
m4(4, 2) = 4 * m4(4, 1) = 16</br>
m4(4, 1) = 4 * m4(4, 0) = 4</br>
m4(4, 0) = 1

- What is mystery4(5, 0)?</br>
m4(5,0) = **1**

- What is the time complexity of mystery4(b, e)?</br>
O(e) number of steps will be needed to compute.

- What is the space complexity of mystery4(b, e)?</br>
O(e) number of stack frames will be needed to compute.

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

- What is mystery5("hi")?</br>
m5("hi") = * + m5("i") = __**__</br>
m5("i") = * + m5("") = *</br>
m5("") = ""

- What is mystery5("")?</br>
m5("") = __""__

- What is mystery5("Hi, there!")?</br>
m5("Hi, there!") = * + m5("i, there!") = __**********__</br>
m5("i, there!") = * + m5(", there!") = *********</br>
m5(", there!") = * + m5(" there!") = ********</br>
m5(" there!") = * + m5("there!") = *******</br>
m5("there!") = * + m5("here!") = ******</br>
m5("here!") = * + m5("ere!") = *****</br>
m5("ere!") = * + m5("re!") = ****</br>
m5("re!") = * + m5("e!") = ***</br>
m5("e!") = * + m5("!") = **</br>
m5("!") = * + m5("") = *</br>
m5("") = ""

- What is the time complexity of mystery5(s)?</br>
O(n) where n is the length of s. A computation must be performed for each character in the string.

- What is the space complexity of mystery5(s)?</br>
O(n) where n is the length of s. There will be n recursive steps showing up in the stack frame. A new string is created at each step of the recursion. The last step will create an empty string. The second to last stack frame will return a string of length 1 and so on. The final step will return a new string of length n. Overall, accounting for the final new string and call stack, the space complexity will be O(n).

- _Added Fun: How could we make only alphabetic characters to be changed to stars?_</br>
See added_fun_solutions.rb

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

- What is mystery6("goodnight moon")?</br>
m6("goodnight moon") = m6("moon") + " " + "goodnight" = **" moon goodnight"**</br>
m6("moon") = m6("") + " " + "moon" = " moon"</br>
m6("") = ("")

- What is mystery6("Ada Developers Academy")?</br>
m6("Ada Developers Academy") = m6("Developers Academy") + " " + "Ada" = **" Academy Developers Ada"**</br>
m6("Developers Academy") = m6("Academy") + " " + "Developers" = " Developers Academy"</br>
m6("Academy") = m6("") + " " + "Academy" = " Academy"</br>
m6("") = ""

- What is mystery6("Hi, there!")?</br>
m6("Hi, there!") = m6("there!") + " " + "Hi," = **" there! Hi,"**</br>
m6("there!") = m6("") + " " + "there!" =  " there!"</br>
m6("") = ""

- What is the time complexity of mystery6(s)?</br>
O(n) where n is the length of s. Each character in s will need to be examined.

- What is the space complexity of mystery6(s)?</br>
If there are k words in s, there will be a total of O(k) records in the activation chain taking up O(k) space. A new string gets created for each word and each character gets copied in to a new string that gets returned to the caller. If there n characters in s, a new string with n characters will get returned. n will be equal to or greater than k. The space complexity is thus O(n).

- _Added Fun: How could we make the reversal happen by letter, instead of by word (i.e. Make it so that mystery6("goodnight moon") returned "noom thgindoog")?_</br>
See added_fun_solutions.rb

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

- What is mystery7("cupcake")?</br>
m7("cupcake") = **false** 

- What is mystery7("detected")?</br>
m7("detected") = m7("etecte") = **false**</br>
m7("etecte") = m7("tect")</br>
m7("tect") = m7("ec")</br>
m7("ec") = false

- What is mystery7("eye")?</br>
m7("eye") = m7("y") = **true**</br>
m7("y") = true

- What is the time complexity of mystery7(word)?</br>
O(n) where n is the length of word. n/2 number of steps will be needed to compute.

- What is the space complexity of mystery7(word)?</br>
O(n) where n is the length of word. At the most n/2 number of stack frames will show up during the recursive function call in the cases where word is a palindrome.


## factorial(n)
Write a method factorial that accepts an integer parameter n and that uses recursion to compute and return the value of n factorial (also known as n!).

## fib(n)
Write a method fib that accepts an integer n as a parameter and returns the nth fibonacci number.

## pal(s)
Write a method pal that accepts a string s as a parameter and returns a boolean value indicating if that string is a palindrome or not.


## binary(n)
Write a method binary that accepts an integer n as a parameter and that returns a string of all binary numbers that have n digits in ascending order. All n digits should be shown for all numbers, including leading zeros if necessary. You may assume that n is non-negative. If n is 0, an empty string should be returned. Do not use a loop in your solution; implement it recursively.

## travel(x,y)
Write a method travel that accepts integers x and y as parameters and uses recursive backtracking to return all solutions for traveling in the 2-D plane from (0, 0) to (x, y) by repeatedly using one of three moves:

East (E): move right 1 (increase x)
North (N): move up 1 (increase y)

The following  shows one such path to the point (5, 3).
0,0
1,0
2,0
3,0
4,0
5,0
5,1
5,2
5,3
==> EEEEEENNN

You may assume that the x/y values passed are non-negative. If x and y are both 0, return an empty string.

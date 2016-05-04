#RC:n! = n* (n-1)
#BC: 1! = 1
#BC: 0! = 1

def fact(n)
  if n == 0 || n== 1
    return  1
  end
    return n * fact(n-1)
end



# adds two numbers that came before it
# fib(4) == 3
# 1 1 2 3 5 8 13
# fib(3) = fib(1) + fib(2)
# fib(4) = fib(3) + fib(2)

def fib(n)
  if n == 1 || n == 2
    return 1
  end
  fib(n-1) + fib(n-2)
end

def pal(s)
  if s.length == 0
    return true
  else
    letter1 = s[0]
    letter2 = s[-1]
    if letter1 != letter2
      return false
    else pal(s[1..-2])
    end
  end
end

def binary(n)
  binary_helper(n,"","")
end

def binary_helper(digits,binary,result)
  if digits == 0
    result += binary + " "
    return result
  end
  result = binary_helper(digits-1,binary+"0",result)
  result = binary_helper(digits-1,binary+"1",result)
  return result
end
#
#
# def travel(x,y)
# end

# Factorial Tests

# Binary Tests

raise "factorial broke - fact(4)" unless fact(4) == 24
raise "factorial broke - fact(0)" unless fact(0) == 1
puts "passes all factorial tests"

# Fibanocci Tests
raise "fib broke - fib(8)" unless fib(8) == 21
raise "fib broke - fib(20)" unless fib(20) == 6765
raise "fib broke - fib(1)" unless fib(1) == 1
raise "fib broke - fib(2)" unless fib(2) == 1
puts "passes all fibanocci tests"

# Palindrome Tests
raise "pal broke - pal('racecar')" unless pal("racecar") == true
raise "pal broke - pal('helloworld')" unless pal("helloworld") == false
raise "pal broke - pal('')" unless pal("") == true
puts "passes all palindrome tests"
puts "All test passed"



raise "binary broke - binary(1)" unless binary(1) == "0 1 "
raise "binary broke - binary(2)" unless binary(2) == "00 01 10 11 "
raise "binary broke - binary(7)" unless binary(7) == "0000000 0000001 0000010 0000011 0000100 0000101 0000110 0000111 0001000 0001001 0001010 0001011 0001100 0001101 0001110 0001111 0010000 0010001 0010010 0010011 0010100 0010101 0010110 0010111 0011000 0011001 0011010 0011011 0011100 0011101 0011110 0011111 0100000 0100001 0100010 0100011 0100100 0100101 0100110 0100111 0101000 0101001 0101010 0101011 0101100 0101101 0101110 0101111 0110000 0110001 0110010 0110011 0110100 0110101 0110110 0110111 0111000 0111001 0111010 0111011 0111100 0111101 0111110 0111111 1000000 1000001 1000010 1000011 1000100 1000101 1000110 1000111 1001000 1001001 1001010 1001011 1001100 1001101 1001110 1001111 1010000 1010001 1010010 1010011 1010100 1010101 1010110 1010111 1011000 1011001 1011010 1011011 1011100 1011101 1011110 1011111 1100000 1100001 1100010 1100011 1100100 1100101 1100110 1100111 1101000 1101001 1101010 1101011 1101100 1101101 1101110 1101111 1110000 1110001 1110010 1110011 1110100 1110101 1110110 1110111 1111000 1111001 1111010 1111011 1111100 1111101 1111110 1111111 "

# Travel Tests
raise "travel broke - travel(1,2)" unless travel(1,2) == "ENN NEN NNE"
raise "travel broke - travel(2,2)" unless travel(2,2) == "EENN ENEN ENNE NEEN NENE NNEE"

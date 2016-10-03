
def fact(n)
  if n == 0 || n == 1
    return 1
  else
    return n * fact(n-1)
  end
end

def mystery(n)
  if n<10
    return n
  else
    return (n%10) + mystery(n/10)
  end
end

def mystery2(n)
  if n == 0
    return 100
  elsif n == -1
    return 200
  end
  if n % 2 == 0
    return mystery2(n/2)
  else
    return mystery2(n-1)
  end
end

puts mystery2(13)
puts mystery2(-6)

def reverse(s)

end

def nested(s)
end

# Factorial Tests
raise "factorial broke - fact(4)" unless fact(4) == 24
raise "factorial broke - fact(0)" unless fact(0) == 1
puts "passes all factorial tests"

# Reverse Tests


puts "All test passed"

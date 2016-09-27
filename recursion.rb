
def factorial(n)
end

def reverse(s)
end

def bunny(n)
end

def nested(s)
end

# Factorial Tests
raise "factorial broke - factorial(4)" unless factorial(4) == 24
raise "factorial broke - factorial(0)" unless factorial(0) == 1
puts "passes all factorial tests"

# Reverse Tests
raise "reverse broke - reverse('hello')" unless reverse("hello") == "olleh"
raise "reverse broke - reverse('a b c')" unless reverse("a b c") == "c b a"
puts "passes all reverse tests"

# Bunny Tests
raise "bunny broke - bunny(0)" unless bunny(0) == 0
raise "bunny broke - bunny(10)" unless bunny(10) == 20
puts "passes all bunny tests"

# Nested Tests
raise "nested broke - nested('((()))')" unless reverse("((()))") == true
raise "nested broke - nested('())')" unless reverse("())") == false
puts "passes all nested tests"

puts "All test passed"

# Write a method named print_array that accepts an array of integers as a parameter and that prints the contents of the array as a bracketed, comma-separated list.
#

# For example, if a variable called list stores the following values: list = [3, 19, 27, 4, 98, 304, -9, 72]
#
# Then the call of print(list) should produce the following output: [3, 19, 27, 4, 98, 304, -9, 72]
#
# Your method should produce a single line of output (may wrap with long lists).

# def print_array(integers_array)
#   return "[#{print_array(integers_array)}]"
#
# end
#
# puts print_array([5, 7, 9])

# Write a method named stretch that accepts an array of integers as a parameter and returns a new array twice as large as the original, where every integer from the original array is replaced with a pair of integers, each half the original.
#
# If a number in the original array is odd, then the first number in the new pair should be one higher than the second so that the sum equals the original number.
#
# For example, if a variable named list refers to an array storing the values [18, 7, 4, 24, 11], the call of stretch(list) should return a new array containing [9, 9, 4, 3, 2, 2, 12, 12, 6, 5]. (The number 18 is stretched into the pair 9, 9, the number 7 is stretched into 4, 3, the number 4 is stretched into 2, 2, the number 24 is stretched into 12, 12 and the number 11 is stretched into 6, 5.)

def stretch(integers_array)
  new_array = Array.new
  i = 0

  while i < integers_array.length

    if integers_array[i].to_i % 2 == 0
      new_array << integers_array[i].to_i / 2
      new_array << integers_array[i].to_i / 2
    else
      new_array << (integers_array[i]/2).to_i + 1;
      new_array << (integers_array[i]/2).to_i;
    end

    i += 1

  end

  return new_array

end


print stretch([0, 2, 5, 10, 16, -6])


# Write a method named numUnique that accepts a sorted array of integers as a parameter and utilizes a hash to calculate and return the number of unique values in the array. The array is guaranteed to be in sorted order, which means that duplicates will be grouped together.
#
# For example, if a variable called list stores the following values: list = [5, 7, 7, 7, 8, 22, 22, 23, 31, 35, 35, 40, 40, 40, 41] then the call of numUnique(list) should return 9 because this list has 9 unique values (5, 7, 8, 22, 23, 31, 35, 40 and 41).
#
# It is possible that the list might not have any duplicates. For example if list instead stored this sequence of values: list = [1, 2, 11, 17, 19, 20, 23, 24, 25, 26, 31, 34, 37, 40, 41] Then a call on the method would return 15 because this list contains 15 different values.
#
# If passed an empty list, your method should return 0.


# def numUnique
# end





# Write a method named numUnique2 that functions the same as numUnique except that it does NOT use a hash to solve the problem. In this version, you should only iterate over the array, but use no auxiliary storage outside of fixnum variables, if needed.
#
# Remember that you can assume that the values in the array appear in sorted (nondecreasing) order.

# def numUnique2
#
# end

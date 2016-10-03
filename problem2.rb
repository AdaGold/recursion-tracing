
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

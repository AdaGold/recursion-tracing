# How could we make `mystery2(-123)` work the way we might expect it to work instead of the way it does?_
def mystery2(n)
  if n < 0 # add consideration for negative values of n
    return -1 * mystery2(-n)
  elsif n < 10
    return n
  else
    return (n%10) + mystery2(n/10)
  end
end

# How could we make only alphabetic characters to be changed to stars?_
def mystery5(s)
  if s.length == 0
    return ""
  elsif s[0].match(/[a-zA-Z]/) # added check for alphabetic characters
    return "*" + mystery5(s[1..-1])
  else # is not alphabetic character, keep as is
    return s[0] + mystery5(s[1..-1])
  end
end

# How could we make the reversal happen by letter, instead of by word (i.e. Make it so that mystery6("goodnight moon") returned "noom thgindoog")?_
def mystery6(s)
  if s.length < 2
    return s
  else
    return mystery6(s[1..-1]) + s[0]
  end
end

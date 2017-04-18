def mystery2(n)
  if n < 0
    return -1 * mystery2(-n)
  elsif n < 10
    return n
  else
    return (n%10) + mystery2(n/10)
  end
end

def mystery5(s)
  if s.length == 0
    return ""
  elsif s[0].match(/[a-zA-Z]/)
    return "*" + mystery5(s[1..-1])
  else
    return s[0] + mystery5(s[1..-1])
  end
end

def mystery6(s)
  if s.length < 2
    return s
  else
    return mystery6(s[1..-1]) + s[0]
  end
end

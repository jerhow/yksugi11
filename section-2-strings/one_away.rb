# Exercise 8:
# 
# Given two strings, determine whether they are one "edit"
# away from being equal. Function returns a boolean.
# 
# There are three types of "edits":
# 1. Changing one character in one of the strings
# 2. Adding one character to one of the strings
# 3. Removing one character from one of the strings
# 
# Solve in O(n) linear time


def is_one_away_same_length(str1, str2)
  result = nil
  change_count = 0

  str1.split('').each_with_index do |chr, idx|
    change_count += 1 if str1[idx] != str2[idx]
    return false if change_count > 1
  end

  true
end
# p is_one_away_same_length('abcde', 'abfde')

def is_one_away_diff_lengths(str1, str2)
  i = 0
  change_count = 0

  while i < str2.length
    if str1[i + change_count] == str2[i]
      i += 1
    else
      change_count += 1
      return false if change_count > 1
    end
  end

  true
end
# p is_one_away_diff_lengths('abcde', 'abcd')

# The main function:
def is_one_away(str1, str2)
  if str1.length - str2.length >= 2 || str2.length - str1.length >= 2
    return false
  elsif str1.length == str2.length
    return is_one_away_same_length(str1, str2)
  elsif str1.length > str2.length
    return is_one_away_diff_lengths(str1, str2)
  else
    return is_one_away_diff_lengths(str2, str1)
  end
end

p is_one_away('abcde', 'abfde')
p is_one_away('abcde', 'abcd')
p is_one_away('abcde', 'abcdef')
p is_one_away('abcde', 'abcfef')

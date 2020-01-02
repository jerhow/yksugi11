# Exercise 7:
# 
# Given a string, return the non-repeating character.
# If there are multiple, just return the first one.
# If there are none, return nil.
# Solve in O(n) linear time

# Version 1:
# 1. Count the instances and store the results in a hash
# 2. Sort the hash ascending by count, resulting in a nested array of pairs
# 3. If the count of the first element is 1, you've got a match. If not, nil.
def non_repeating_1(str)
  counts = {}
  result = nil

  str.split('').each do |char|
    counts[char] ? counts[char] += 1 : counts[char] = 1
  end

  counts = counts.sort_by { |char, count| count }

  if counts[0][1] == 1
    result = counts[0][0]
  end

  result
end

# Version 2:
# 1. Count the instances and store the results in a hash
# 2. Iterate the hash looking for a value of 1. If found, return the key.
# If there is no value of 1, return nil.
def non_repeating_2(str)
  counts = {}
  result = nil

  str.split('').each do |char|
    counts[char] ? counts[char] += 1 : counts[char] = 1
  end

  counts.each do |key, val|
    if val == 1
      result = key
      break
    end
  end

  result
end

p non_repeating_1 'aabcb'
p non_repeating_1 'xxyz'

puts

p non_repeating_1 'aabcb'
p non_repeating_1 'xxyz'

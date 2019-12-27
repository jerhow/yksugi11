# Exercise 2:
#
# Find the common elements in two sorted arrays.
# Solve in O(max(n, m)) (linear) time, where n is a and m is b.
#
# a = [1, 3, 4, 6, 7, 9]
# b = [1, 2, 4, 5, 9, 10]
#
# common_elements(a, b) -> [1, 4, 9]

# Solution 1:
# Iterate over 'a', doing an include? check in 'b' for each element.
# This is an inefficient solution UNLESS 'b' can be a data structure with
# fast lookups. So convert 'b' into a set, and get constant time lookups on it.
#
# Array#include? is O(n) linear, but Set#include? is O(1) constant. Nice.
#
# NOTE: You can also achieve O(1) lookups by using Hash keys:
# my_hash.has_key?(:key)
require 'set'
def common_elements_1(a, b)
  b = b.to_set
  results = []

  a.each do |n|
    results << n if b.include?(n)
  end

  results
end

# Solution 2:
# Walk both arrays together, using a pointer for each.
# On each iteration, compare the values where your two pointers are pointing:
# If you have a match, capture it and move both pointers forward.
# If the value from 'a' is greater, only move the pointer on 'b' forward.
# If the value from 'b' is greater, only move the pointer on 'a' forward.
# Continue that until you're at the end of both arrays, and return the results.
def common_elements_2(a, b)
  ptr1 = 0
  ptr2 = 0
  results = []

  while ptr1 < a.length && ptr2 < b.length
    if a[ptr1] == b[ptr2]
      results << a[ptr1]
      ptr1 += 1
      ptr2 += 1
    elsif a[ptr1] > b[ptr2]
      ptr2 += 1
    else
      ptr1 += 1
    end
  end

  results
end

# Should return [1, 4, 9]
a = [1, 3, 4, 6, 7, 9]
b = [1, 2, 4, 5, 9, 10]
p common_elements_1 a, b
p common_elements_2 a, b

puts

# Should return [1, 2, 9, 10, 12]
a = [1, 2, 9, 10, 11, 12]
b = [0, 1, 2, 3, 4, 5, 8, 9, 10, 12, 14, 15]
p common_elements_1 a, b
p common_elements_2 a, b

puts

# Should return [] (an empty array)
a = [0, 1, 2, 3, 4, 5]
b = [6, 7, 8, 9, 10, 11]
p common_elements_1 a, b
p common_elements_2 a, b

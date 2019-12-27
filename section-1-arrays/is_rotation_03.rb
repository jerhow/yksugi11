# Exercise 3:
# 
# Is one array a rotation of another?
# Solve in O(n) linear time
#
# NOTE: This exercise stipulates that there are no duplicates in the arrays

# Solution:
# First, make sure both arrays are the same length. One can't be a rotation
# of the other if that's not true.
# 
# Next, take the value of the first element of 'a'. Any element will do,
# but for simplicity's sake just take the first.
# 
# Next, walk 'b' until you find the value that matches your starting value in 'a'.
# If you find that matching value in 'b', capture its index.
# If you don't find a matching value in 'b', you know it's not a rotation of 'a'.
# 
# Now that you know the index of the same value in 'a' [0] and 'b' [wherever],
# walk 'a' completely, comparing the values to the appropriately offset index in 'b'.
# If you encounter any pair of values from 'a' and 'b' that don't match,
# you don't have a rotation. You have to make it all the way through 'a' for 'b'
# to be a rotation of 'a'.
# 
# So yeah, the result is only true if we get to the end of the function
# without tripping any of the previous condition checks.
# 
# NOTE: The real trick here is how you calculate the index offset in 'b'.
# Here we're doing it like so:
# current_index_in_b = (starting_index_in_b + idx) % a.length

def is_rotation(a, b)
  return false if a.length != b.length

  starting_value_in_a = a[0]
  starting_index_in_b = -1

  b.each_with_index do |n, idx|
    if n == starting_value_in_a
      starting_index_in_b = idx
      break
    end
  end

  return false if starting_index_in_b == -1

  a.each_with_index do |n, idx|
    current_index_in_b = (starting_index_in_b + idx) % a.length
    return false if a[idx] != b[current_index_in_b]
  end

  return true
end

list1 = [1, 2, 3, 4, 5, 6, 7]

list2a = [4, 5, 6, 7, 8, 1, 2, 3]
p is_rotation(list1, list2a) # should return false

list2b = [4, 5, 6, 7, 1, 2, 3]
p is_rotation(list1, list2b) # should return true

list2c = [4, 5, 6, 9, 1, 2, 3]
p is_rotation(list1, list2c) # should return false

list2d = [4, 6, 5, 7, 1, 2, 3]
p is_rotation(list1, list2d) # should return false

list2e = [4, 5, 6, 7, 0, 2, 3]
p is_rotation(list1, list2e) # should return false

list2f = [1, 2, 3, 4, 5, 6, 7]
p is_rotation(list1, list2f) # should return true

list2g = [7, 1, 2, 3, 4, 5, 6]
p is_rotation(list1, list2g) # should return true

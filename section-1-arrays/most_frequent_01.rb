# Exercise 1:
#
# Find the most frequently occurring item in an array
# Solve in O(n) linear time

# This solution always works under the assumption that there is ONE value
# which occurs more than all others in the array.

def most_frequent(arr)
  max_count = 0
  max_item = nil
  count = {}

  arr.each do |i|
    count[i] ? count[i] += 1 : count[i] = 1

    if count[i] > max_count
      max_count = count[i]
      max_item = i
    end
  end

  max_item
end

# Should return 1
arr = [1, 3, 1, 3, 2, 1]
p most_frequent arr

# Should return 161
arr = [1, 3, 1, 3, 2, 1, 161, 161, 161, 161, 12, 13, 14, 161, 100, 99, 98, -200, -1]
p most_frequent arr

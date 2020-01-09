# Implement the unique_names method. 
# When passed two arrays of names, it will return an array containing
# the names that appear in either or both arrays. 
# The returned array should have no duplicates.
# 
# For example, calling unique_names(["Ava", "Emma", "Olivia"], ["Olivia", "Sophia", "Emma"])
# should return an array containing Ava, Emma, Olivia, and Sophia in any order.

# Version 1
def unique_names_1(names1, names2)
  seen = []
  names1.each do |name|
    if !seen.include?(name)
      seen << name
    end
  end
  
  names2.each do |name|
    if !seen.include?(name)
      seen << name
    end
  end
  
  seen
end

# Version 2
def unique_names_2(names1, names2)
  (names1 + names2).uniq
end

names1 = ["Ava", "Emma", "Olivia"]
names2 = ["Olivia", "Sophia", "Emma"]
p unique_names_1(names1, names2) # should print Ava, Emma, Olivia, Sophia
p unique_names_2(names1, names2) # should print Ava, Emma, Olivia, Sophia

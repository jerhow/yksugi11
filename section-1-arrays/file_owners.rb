# Implement a group_by_owners function that:
# 
# Accepts a hash containing the file owner name for each file name.
# Returns a hash containing an array of file names for each owner name, in any order.
# For example, for hash {'Input.txt' => 'Randy', 'Code.py' => 'Stan', 'Output.txt' => 'Randy'} 
# the group_by_owners function should return {'Randy' => ['Input.txt', 'Output.txt'], 'Stan' => ['Code.py']}.

def group_by_owners(files)
  results = {}

  files.each do |key, val|
    results[val] ? results[val] << key : results[val] = [key]
  end

  results
end

files = {
  'Input.txt' => 'Randy',
  'Code.py' => 'Stan',
  'Output.txt' => 'Randy'
}

p group_by_owners(files)

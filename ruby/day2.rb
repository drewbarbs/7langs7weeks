#!/usr/bin/env ruby

# Find out how to access files with and without code blocks. What is the benefit of the code block?
#
fname = 'mytmp.txt'
# Contrast
f = File.open(fname, 'w')
f.puts "Hello world!"
f.close # need to explicitly close this
# with
File.open(fname) do |f|
  puts f.read
end # file is closed at the end of the block (like Python "with" statement)

File.delete(fname)

# How would you translate a hash to an array? Can you translate arrays to hashes?
#
# The obvious representation of hash as array is as list of (key, value) pairs,
# this is, indeed, what hash.to_a does
d = {a:1, b:2, c:3}
puts "If hash is #{d}, then hash.to_a is #{d.to_a}"
# As far as array to hash, there's a bump in dimensionality ..., could
# make hash where keys are array indices, values are array vals
# Array.inject is like foldl, equivalent haskell would be
#   foldl (\hash x -> Map.insert (Map.size hash) x hash) Map.empty [1..5]
l = (1..3).to_a
h = l.inject({}) { |hash, v| hash[hash.length] = v and hash }
puts "If list is #{l}, then a hash representation could be #{h}"

# Can you iterate through a hash?
# Sure can, a bunch of ways. Can use h.each/h.each_pair (equivalent),h.each_key, h.each_value
puts "Iterating over the hash, printing key, val+2"
h.each {|k, v| puts "#{k} => #{v+2}"}

# You can use Ruby arrays as stacks. What other common data structures do arrays support?
#
# Arrays can also be used as queues: insert at front with a.unshift(newval), remove from back with a.pop
#   or insert at end with a.push(newval) or a <<  newval, then remove from beginning with a.unshift
#
# Can also use similar to Haskell lists with a.first, a.drop(1) (which is like the list tail)


###
# DO
##

# Print the contents of an array of sixteen numbers, four numbers at a time, using just each.
l = (1..16).to_a
(0..3).each {|i| p l[(4*i..4*i+3)]} # ok, maybe that's cheating
# Now, do the same with each_slice in Enumerable.
l.each_slice(4) {|s| p s}

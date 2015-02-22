#!/usr/bin/env ruby

# Can find the Ruby API docs at http://ruby-doc.org/

# The first edition of Programming Ruby: Pragmatic Programmer's Guide is free,
# but it's dated

# A method that substitutes part of a string: String.sub or String.sub! (latter modifies
#   the string)

puts "Hello, world.\n"

needle, haystack = "Ruby", "Hello, Ruby"
puts """The index of #{needle} in \"#{haystack}\" is #{haystack.index needle}."""

# Print your name 10 times
puts (["Drew"] * 10).join "\n"

(1..10).each {|i| puts "This is sentence number #{i}#{i < 10 ? ',' : '.'}"}

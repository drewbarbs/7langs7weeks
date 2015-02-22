#!/usr/bin/env ruby

secret = rand(10) + 1

puts "Take a guess at a number 1 to 10"
loop do
  guess = gets.to_i
  break if guess == secret
  puts "#{guess < secret ? 'higher' : 'lower'}"
end

puts "Congrats!"

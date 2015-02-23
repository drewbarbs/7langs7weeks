#!/usr/bin/env ruby

unless ARGV.length > 1
  puts "Usage: #{__FILE__} <phrase> <file 1> [<file 2> ...]"
  exit
end

re = Regexp.new(ARGV.first)
files = ARGV.drop(1)

files.each do |fname|
  File.open(fname) do |f|
    f.readlines.each_with_index do |line, lineno|
        puts "#{fname}: #{lineno}: #{line}" if line.match re
    end
  end
end

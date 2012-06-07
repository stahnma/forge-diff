#!/usr/bin/env ruby

require 'awesome_print'
require 'json'

a = JSON::load IO.read('data/modules-now.json')

if File.exists? 'data/modules-last.json'
  b = JSON::load IO.read('data/modules-last.json')
  # This will need cleanup in some way once we actually get something worthwhile to look at
  # Perhaps mail michelle with intersting news?
  diff =  b - a
  if diff.size > 0
    puts "New since #{File.stat('data/modules-last.json').mtime}"
    puts "Name , Author,  Version"
    puts "----------------"
    diff.each do |d|
      puts "#{d['name']}, #{d['author']}, #{d['version']}"
    end
  end

else
  puts "Not enough data for comparison"
  exit 9
end

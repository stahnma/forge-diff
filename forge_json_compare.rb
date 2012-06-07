#!/usr/bin/env ruby

require 'rubygems'
require 'json'
require 'httparty'
require 'awesome_print'
require 'fileutils'

uri = 'http://forge.puppetlabs.com/modules.json'
response = HTTParty.get(uri)
#puts response.body, response.code, response.message, response.headers.inspect

if response.body
  FileUtils.mv 'data/modules-last.json', 'data/modules-stale.json' if File.exists? 'data/modules-last.json'
  FileUtils.mv 'data/modules-now.json', 'data/modules-last.json' if File.exists? 'data/modules-now.json'
  IO.write('data/modules-now.json', response.body)
else
  puts "Did not get HTTP response"
  exit 8
end

a = JSON::load IO.read('data/modules-now.json')

if File.exists? 'data/modules-last.json'
  b = JSON::load IO.read('data/modules-last.json')
  # This will need cleanup in some way once we actually get something worthwhile to look at
  # Perhaps mail michelle with intersting news?
  ap b - a
else
  puts "Not enough data for comparison"
  exit 9
end

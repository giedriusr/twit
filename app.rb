#!/usr/bin/env ruby

require_relative 'app/init'
require_relative 'config/twitter'

client = Twitter::REST::Client.new(@twitter)
client.search("to:twitter").take(10).each do |tweet|
  puts tweet.text
end

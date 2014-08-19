#!/usr/bin/env ruby

require_relative 'app/init'
require_relative 'config/twitter'

loop do
  say('Please select one of the following options:')
  say('1 - to display tweets for mentioned username')
  say('0 - to close the application')
  ('> ').display

  input = gets.chomp
  command, *params = input.split /\s/

  case command
  when '1'
    username = ask('Enter username: ')
    puts ''

    say("--- Loading mentioned tweets for user #{username}.. ---")

    client = Twitter::REST::Client.new(@twitter)
    client.search("to:#{username}").take(10).each do |tweet|
      puts tweet.text
    end

    say('--- end of results ---')
    puts ''
  when '0'
    exit 1
  else
    puts 'Invalid command'
  end
end

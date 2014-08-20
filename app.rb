#!/usr/bin/env ruby

require_relative 'app/init'
require_relative 'config/twitter'
require_relative 'app/twit'

app = Twit.new(@twitter)
app.run

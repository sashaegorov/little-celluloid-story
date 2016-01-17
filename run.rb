#!/usr/bin/env ruby
# Require Bundler
require 'bundler'
Bundler.require

# Require local scripts
require './greeter_plain'
require './greeter_celluloid'

# Run it as `./run.rb`
me = ARGV[0]

def title(text)
  puts "\n\n#{text}\n#{'-' * text.length}"
end

title 'Work with old plain object:'

greeter = GreeterPlain.new('old plain greeter')
puts greeter.greet(me)

title 'Work with Celluloud object:'

actor = GreeterCelluloid.new('just greeter?')
puts actor.greet(me)
actor.async.name = 'renamed via accessor greeter'
puts actor.greet(me)

actor.rename 'rename via method'
# => "rename via method"
puts actor.greet(me)

actor.async.rename 'rename via async method'
# =>
# Nothing.
puts actor.greet(me)

# What is imortant:
# 1) Both `actor.async.name` and `actor.name`
#    returns value
# 2) Only `actor.rename` always returns @name,
#    `actor.async.rename` never do that.
#    Gotchas happes is when actor is crashed...

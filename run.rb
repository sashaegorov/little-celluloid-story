#!/usr/bin/env ruby
# Require Bundler
require 'bundler'
Bundler.require

# Require local scripts
require './greeter_plain'
require './greeter_celluloid'

# Run it as `./run.rb`
me = ARGV[0]

greeter = GreeterPlain.new('old plain greeter')
puts greeter.inspect
puts greeter.greet(me)
#<GreeterPlain:0x007fc07a867198 @name="old plain greeter">
# Yay Sasha, I'm a old plain greeter!

actor = GreeterCelluloid.new('just greeter?')
#<Celluloid::Proxy::Cell(GreeterCelluloid:0x3fd5e1436650) @name="just greeter?">
puts actor.inspect
puts actor.greet(me)
# Yay , I'm a just greeter?!
actor.async.name = 'async greeter'
puts actor.greet(me)
# Yay , I'm a async greeter!

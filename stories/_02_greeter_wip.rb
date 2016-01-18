require './greeter_plain'
require './greeter_celluloid'

# Run it as `./run.rb Alex`
me = ARGV[0]

begin
  title_h1 "Running on: #{RUBY_ENGINE} v#{RUBY_ENGINE_VERSION}"
rescue NameError
end

title_h1 'Old plain object'

greeter = GreeterPlain.new('old plain greeter')

p greeter.greet(me)

title_h1 'Work with Celluloud object:'

actor = GreeterCelluloid.new('just greeter?')
p actor.greet(me)
actor.async.name = 'renamed via accessor greeter'
p actor.greet(me)

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

puts "Is actor alive? #{actor.alive?}"

title_h1 'Let\'s crash it...'

code { actor.goodbye }

title_h1 'Ok. Now it\'s crashed'
puts "Is actor alive? #{actor.alive?}"

title_h1 'Dealing with dead actor'

puts 'Tying to rename it.'
# Here will be an error
result = begin
  actor.rename 'rename via method'
rescue Celluloid::DeadActorError => e
  e
end
puts "Rename result: #{result}"

puts 'How about async?'
actor.async.rename 'silent fail'
puts 'Nothing...'

#!/usr/bin/env ruby
require './lib/common'

MarkdownLog.h1 'Meet Celluloid'

MarkdownLog.p <<-P
This is a small story about little `Celluloid` and it's actors and cells. \
Nothing to tell more in the introduction. Just let's get started.
P

MarkdownLog.h2 'Just require'

MarkdownLog.p <<-P
As soon as you have made `require 'celluloid/current'` it's already with us.
But before we start playing with it *correct way* let's require deprecated \
version via `require 'celluloid'` and see what will happen:
P

MarkdownLog.code do
  puts "require 'celluloid'"
end

MarkdownLog.p 'Boom! As result we have got depreciation warning as show:'

# Invoke deprecation warning
MarkdownLog.code do
  require 'celluloid'
end

MarkdownLog.p <<-P
So please make sure you *don't* require it as `require 'celluloid'` or you have to deal with refactoring your code in near future. This warning works for Celluloid version #{Celluloid.version}.
P

MarkdownLog.p <<-P
Let's take a look on Ruby `Thread.list`:
P

MarkdownLog.print Thread.list

MarkdownLog.p <<-P
It seems there is nothing interesting here. Pretty disappointing, right?
Now let's try to do this *correct way* as was told before:
P

MarkdownLog.code "require 'celluloid/current'"
require 'celluloid/current'

MarkdownLog.p <<-P
I have to say this is the completely silent thing. \
It outputs nothing, it just returns `true` as `require` usually does. \
However, lots of interesting stuff happened under Ruby's hood. \
Let's check Ruby's `Thread.list` again:
P

MarkdownLog.print Thread.list

MarkdownLog.p <<-P
Can you see what happened? Yes, now we see not only vanilla `<Thread>` object, we can recognize Celluloid's threads denoted by `<Celluloid::Thread>`. This is a very important concept you should understand it very well. _Celluloid relies on Ruby's `Thread`. Threads behave differently depending on particular Ruby implementation.
P

MarkdownLog.p <<-P
This is a good time \
[to](https://en.wikipedia.org/wiki/Global_interpreter_lock) \ [meet](https://www.igvita.com/2008/11/13/concurrency-is-a-myth-in-ruby/) \
[Ruby's](http://www.rubyinside.com/does-the-gil-make-your-ruby-code-thread-safe-6051.html)
[GIL](http://www.rubyinside.com/does-the-gil-make-your-ruby-code-thread-safe-6051.html) if you are not. By the way, all these links are different. Take a look on this seasoned articles.
P

MarkdownLog.p <<-P
Also, this is the good time to get familiar \
[JRuby](http://jruby.org/) \
and
[Rubinius](http://rubinius.com/).
These Ruby implementations have something common — they support "true" or native threads.
P

# TODO: https://github.com/celluloid/timers
# https://github.com/celluloid/dcell/wiki/Prerequisites
# https://github.com/tinco/celluloid-websocket
# https://github.com/celluloid/reel
# https://github.com/celluloid/celluloid/wiki/Blocks

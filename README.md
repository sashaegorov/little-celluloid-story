
Meet Celluloid
==============

This is a small story about little `Celluloid` and it's actors and cells. Nothing to tell more in the introduction. Just let's get started.


Just require
------------

As soon as you have made `require 'celluloid/current'` it's already with us.
But before we start playing with it *correct way* let's require deprecated version via `require 'celluloid'` and see what will happen:


```
require 'celluloid'
```

Boom! As result we have got depreciation warning as show:

```
I, [2016-01-19T02:38:53.649352 #27750]  INFO -- : Celluloid 0.17.2 is running in BACKPORTED mode. [ http://git.io/vJf3J ]
```

So please make sure you *don't* require it as `require 'celluloid'` or you have to deal with refactoring your code in near future. This warning works for Celluloid version 0.17.2.


Let's take a look on Ruby `Thread.list`:


```
[
    [0] #<Thread:0x007ff12a8a43a0 run>
]
```

It seems there is nothing interesting here. Pretty disappointing, right?
Now let's try to do this *correct way* as was told before:


```
require 'celluloid/current'
```

I have to say this is the completely silent thing. It outputs nothing, it just returns `true` as `require` usually does. However, lots of interesting stuff happened under Ruby's hood. Let's check Ruby's `Thread.list` again:


```
[
    [0] #<Thread:0x007ff12a8a43a0 run>,
    [1] #<Celluloid::Thread:0x007ff12a0b7020@celluloid-0.17.2/lib/celluloid/group/spawner.rb:47 sleep>,
    [2] #<Celluloid::Thread:0x007ff12a0adf48@celluloid-0.17.2/lib/celluloid/group/spawner.rb:47 sleep>,
    [3] #<Celluloid::Thread:0x007ff12b8bf7f8@celluloid-0.17.2/lib/celluloid/group/spawner.rb:47 sleep>,
    [4] #<Celluloid::Thread:0x007ff12b8af9e8@celluloid-0.17.2/lib/celluloid/group/spawner.rb:47 sleep>
]
```

Can you see what happened? Yes, now we see not only vanilla `<Thread>` object, we can recognize Celluloid's threads denoted by `<Celluloid::Thread>`. This is a very important concept you should understand it very well. _Celluloid relies on Ruby's `Thread`. Threads behave differently depending on particular Ruby implementation.


This is a good time [to](https://en.wikipedia.org/wiki/Global_interpreter_lock)  [meet](https://www.igvita.com/2008/11/13/concurrency-is-a-myth-in-ruby/) [Ruby's](http://www.rubyinside.com/does-the-gil-make-your-ruby-code-thread-safe-6051.html)
[GIL](http://www.rubyinside.com/does-the-gil-make-your-ruby-code-thread-safe-6051.html) if you are not. By the way, all these links are different. Take a look on this seasoned articles.


Also, this is the good time to get familiar [JRuby](http://jruby.org/) and
[Rubinius](http://rubinius.com/).
These Ruby implementations have something common — they support "true" or native threads.


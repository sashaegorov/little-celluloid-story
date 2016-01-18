class GreeterCelluloid
  include Celluloid
  attr_accessor :name, :boom, :timer

  def initialize(name)
    @name = name
  end

  def greet(person)
    "> Yay #{person}, I'm a #{@name}!"
  end

  # We can't call #name= async way
  # So we need #rename
  def rename(new_name)
    @name = new_name
  end

  def goodbye
    raise "I won't say goodbay..."
  end

  def boom(delay, text)
    @Celluloid.after(delay) do |x|

      puts "Boom, #{text}!"
    end
  end

end

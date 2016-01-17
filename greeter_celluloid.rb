class GreeterCelluloid
  include Celluloid
  attr_accessor :name

  def initialize(name)
    @name = name
  end
  def greet(person)
    "Yay #{person}, I'm a #{@name}!"
  end
end

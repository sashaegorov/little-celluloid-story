class GreeterPlain
  def initialize(name)
    @name = name
  end
  def greet(person)
    "> Yay #{person}, I'm a #{@name}!"
  end
end

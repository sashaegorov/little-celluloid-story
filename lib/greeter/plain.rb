class Greeter
  def initialize(name = 'greeter')
    @name = name
  end
  def greet(person)
    "Yay #{person}, I'm a #{@name}!"
  end
end

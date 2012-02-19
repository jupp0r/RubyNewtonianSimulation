require 'mass'
require 'initializer'

# simulates n-bodys in a newtonian way

puts "Hello User"

system = initializer.new
planets = system.getplanets


for i in planets.each
  for j in planets.each
    
  end
  
  i.setmove(mov)
  i.setposition(pos)
end
require './mass.rb'
require './initializer.rb'
require 'matrix'

# simulates n-bodys in a newtonian way

system = Initializer.new
planets = system.planets
p1 = system.planets.clone

planets.each { |k,v|  
  puts k + ": "
  puts v.forces
}

planets.each { |k,v|  
  puts "puts v.inspect: " + v.inspect
  v.calcforces(p1)
  puts "puts v.inspect, after: " + v.inspect + "\n\n"
}

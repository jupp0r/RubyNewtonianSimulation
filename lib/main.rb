require './mass.rb'
require './initializer.rb'
require 'matrix'

# simulates n-bodys in a newtonian way

system = Initializer.new
planets = system.getplanets
p1 = system.getplanets

planets.each { |k,v|  
  puts k + ": "
  puts v.getforces
}

planets.each { |k,v|  
  puts "puts v.inspect: " + v.inspect
  v.calcforces(p1)
  puts "puts v.inspect, after: " + v.inspect + "\n\n"
}
  
require 'mass'
require 'initializer'
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
#  puts "puts v.class: " + v.class
  v.calcforces(p1)
  }
  
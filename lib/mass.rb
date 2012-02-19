require 'matrix'

# This class represents one object/mass
# at the moment we support only simple point-masses
class Mass

attr_accessor :mass, :move, :position, :forces, :acceleration
  
  def initialize(m, ar, pos)
    @movedb = Vector[0.0, 0.0, 0.0]
    @forces = Vector[0.0, 0.0, 0.0]
    @positiondb = Vector[0.0, 0.0, 0.0]
    @acceleration = Vector[0.0, 0.0, 0.0]
    @mass = m
    @move = ar
    @position = pos
    @@g = 6.67384*10**(-11)
  end
  
  def calcforces(others)
    sumf = Vector[0.0, 0.0, 0.0]
    
#    puts "mass.rb - others.inspect: " + others.inspect
    
    others.each do |k,i|
      a = (i.position[0] - @position[0])**2 + 
          (i.position[1] - @position[1])**2 + 
          (i.position[2] - @position[2])**2
      
#      puts "mass.rb - a.inspect" + a.inspect
      
      a = Math.sqrt(a)**3
      sumf += (i.mass * ((i.position - @position) * (1.0/a)))
    end
    
    @forces = sumf * @@g
  end
  
  def calcaccel
    @acceleration = @forces / @mass
  end

  def position= (position)
    @positiondb = position
  end

  def move= (move)
      @movedb = move
  end
  
  # updates all values from double-buffer to values
  def update
    @move = @movedb
    @position = @positiondb
  end
  
end

require 'matrix'

# This class represents one object/mass
# at the moment we support only simple point-masses
class Mass
  
  def initialize(m, ar, pos)
    @mass = 0.0
    @move = Vector[0.0, 0.0, 0.0]
    @movedb = Vector[0.0, 0.0, 0.0]
    @position = Vector[0.0, 0.0, 0.0]
    @positiondb = Vector[0.0, 0.0, 0.0]
    @forces = Vector[0.0, 0.0, 0.0]
    @acceleration = Vector[0.0, 0.0, 0.0]
    @mass = m
    @move = ar
    @position = pos
  end
  
  def setposition(pos)
    @positiondb = pos
  end
  
  def setmove(mov)
    @movedb = mov
  end
  
  def getmove
    return @move
  end
  
  def getmass
    return @mass
  end
  
  def getposition
    return @position
  end
  
  def getforces
    return @forces
  end
  
  def calcforces(others)
    sumf = Vector[0.0, 0.0, 0.0]
    g = 6.67384*10**(-11)
    
    puts "mass.rb - others.inspect: " + others.inspect
    
    others.each_value do |i|
      a = Math.sqrt((i.getposition[0] - @position[0]) + 
          (i.getposition[1] - @position[1]) + 
          (i.getposition[2] - @position[2]))**3
      
      sumf += i.getmass * ((i.getposition - @position) * (1.0/a))
    end
    
    @forces = g * sumf
  end
  
  def calcaccel
    @acceleration = @forces / @mass
  end
  
  # updates all values from double-buffer to values
  def update
    @move = @movedb
    @position = @positiondb
    
  end
  
end

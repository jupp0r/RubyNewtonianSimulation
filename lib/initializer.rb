require './mass.rb'
require 'matrix'
# This is just a container for lengthy input-parameters
class Initializer

  attr_reader :planets
  
  def initialize
    @planets = Hash.new
    
    # The Sun
    @planets["sun"] = Mass.new(
        100,              # Mass = 1
        Vector[0.0, 0.0, 0.0],      # Motion in direction of x
        Vector[0.0, 0.0, 0.0]   # At center of coordinate system
      )
    
    
    # Merkur
    @planets["merkur"] = Mass.new(
        1,                # Mass = 1
        Vector[1.0, 0, 0],      # Motion in direction of x
        Vector[10.0, 0.0, 0.0]  # outsite the center
      )
    
    
    # Venus
    @planets["venus"] = Mass.new(
        1.5,              # Mass = 1
        Vector[0.0, 1.0, 0],      # Motion in direction of x
        Vector[0.0, 20.0, 0.0]  # outsite the center
      )
  end
    
end

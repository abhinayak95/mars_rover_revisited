Code.require_file("coordinate.ex")
Code.require_file("mars_rover.ex")
Code.require_file("plateau.ex")

defmodule Main do
  def main do
    plateau = %Plateau{coord: %Coordinate{x_coord: 5, y_coord: 5}}
    rover = %MarsRover{coord: %Coordinate{x_coord: 3, y_coord: 3}, direction: "E"}
    rover = MarsRover.move(rover,"MMRMMRMRRM")
    # Plateau.within_boundaries(rover, plateau)
  end
end

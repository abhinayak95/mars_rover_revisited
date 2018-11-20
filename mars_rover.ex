defmodule Coordinate do
  defstruct [:x_coord, :y_coord]
end

defmodule MarsRover do
  defstruct [:x_coord, :y_coord, :direction]

  # def direction('N','L') do
  #   %MarsRover{direction: 'W'}
  # end
  def direction(%MarsRover{x_coord: x_coord, y_coord: y_coord, direction: "E"} ,"L") do
    %MarsRover{x_coord: x_coord, y_coord: y_coord, direction: "N"}
  end

  def direction(%MarsRover{x_coord: x_coord, y_coord: y_coord, direction: "E"} ,"R") do
    %MarsRover{x_coord: x_coord, y_coord: y_coord, direction: "S"}
  end

  def direction(%MarsRover{x_coord: x_coord, y_coord: y_coord, direction: "E"} ,"M") do
    %MarsRover{x_coord: x_coord + 1, y_coord: y_coord, direction: "E"}
  end

  def direction(%MarsRover{x_coord: x_coord, y_coord: y_coord, direction: "W"} ,"L") do
    %MarsRover{x_coord: x_coord, y_coord: y_coord, direction: "S"}
  end

  def direction(%MarsRover{x_coord: x_coord, y_coord: y_coord, direction: "W"} ,"R") do
    %MarsRover{x_coord: x_coord, y_coord: y_coord, direction: "N"}
  end

  def direction(%MarsRover{x_coord: x_coord, y_coord: y_coord, direction: "W"} ,"M") do
    %MarsRover{x_coord: x_coord - 1, y_coord: y_coord, direction: "W"}
  end

  def direction(%MarsRover{x_coord: x_coord, y_coord: y_coord, direction: "N"} ,"L") do
    %MarsRover{x_coord: x_coord, y_coord: y_coord, direction: "W"}
  end

  def direction(%MarsRover{x_coord: x_coord, y_coord: y_coord, direction: "N"} ,"R") do
    %MarsRover{x_coord: x_coord, y_coord: y_coord, direction: "E"}
  end

  def direction(%MarsRover{x_coord: x_coord, y_coord: y_coord, direction: "N"} ,"M") do
    %MarsRover{x_coord: x_coord, y_coord: y_coord + 1, direction: "N"}
  end

  def direction(%MarsRover{x_coord: x_coord, y_coord: y_coord, direction: "S"} ,"L") do
    %MarsRover{x_coord: x_coord, y_coord: y_coord, direction: "E"}
  end

  def direction(%MarsRover{x_coord: x_coord, y_coord: y_coord, direction: "S"} ,"R") do
    %MarsRover{x_coord: x_coord, y_coord: y_coord, direction: "W"}
  end

  def direction(%MarsRover{x_coord: x_coord, y_coord: y_coord, direction: "S"} ,"M") do
    %MarsRover{x_coord: x_coord, y_coord: y_coord - 1, direction: "S"}
  end

  def move(rover, instructions) do
    instruction_list = String.split(instructions, "", trim: true)
    rover = Enum.reduce(instruction_list, rover , fn instruction, rover ->
      direction(rover, instruction)
    end)
  end

end


defmodule Main do
  def main do
    rover = %MarsRover{x_coord: 3, y_coord: 3, direction: "E"}
    rover = MarsRover.move(rover,"MMRMMRMRRM")
  end
end

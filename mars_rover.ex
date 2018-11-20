Code.require_file("coordinate.ex")

defmodule MarsRover do
  defstruct [:coord, :direction]

  def direction(%MarsRover{coord: coord, direction: "E"} ,"L") do
    %MarsRover{coord: coord, direction: "N"}
  end

  def direction(%MarsRover{coord: coord, direction: "E"} ,"R") do
    %MarsRover{coord: coord, direction: "S"}
  end

  def direction(%MarsRover{coord: coord, direction: "E"} ,"M") do
    %MarsRover{coord: %Coordinate{coord | x_coord: coord.x_coord + 1}, direction: "E"}
  end

  def direction(%MarsRover{coord: coord, direction: "W"} ,"L") do
    %MarsRover{coord: coord, direction: "S"}
  end

  def direction(%MarsRover{coord: coord, direction: "W"} ,"R") do
    %MarsRover{coord: coord, direction: "N"}
  end

  def direction(%MarsRover{coord: coord, direction: "W"} ,"M") do
    %MarsRover{coord: %Coordinate{coord | x_coord: coord.x_coord - 1}, direction: "W"}
  end

  def direction(%MarsRover{coord: coord, direction: "N"} ,"L") do
    %MarsRover{coord: coord, direction: "W"}
  end

  def direction(%MarsRover{coord: coord, direction: "N"} ,"R") do
    %MarsRover{coord: coord, direction: "E"}
  end

  def direction(%MarsRover{coord: coord, direction: "N"} ,"M") do
    %MarsRover{coord: %Coordinate{coord | y_coord: coord.y_coord + 1}, direction: "N"}
  end

  def direction(%MarsRover{coord: coord, direction: "S"} ,"L") do
    %MarsRover{coord: coord, direction: "E"}
  end

  def direction(%MarsRover{coord: coord, direction: "S"} ,"R") do
    %MarsRover{coord: coord, direction: "W"}
  end

  def direction(%MarsRover{coord: coord, direction: "S"} ,"M") do
    %MarsRover{coord: %Coordinate{coord | y_coord: coord.y_coord - 1}, direction: "S"}
  end

  def move(rover, instructions) do
    instruction_list = String.split(instructions, "", trim: true)
    rover = Enum.reduce(instruction_list, rover , fn instruction, rover ->
      direction(rover, instruction)
    end)
  end

end

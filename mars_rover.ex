defmodule Coordinate do
  defstruct [:x_coord, :y_coord]
end

defmodule MarsRover do
  defstruct [:x_coord, :y_coord, :direction]

  # def direction('N','L') do
  #   %MarsRover{direction: 'W'}
  # end
  def direction(%MarsRover{x_coord: x_coord, y_coord: y_coord, direction: 'E'} ,'L') do
    rover = %MarsRover{x_coord: x_coord, y_coord: y_coord, direction: 'N'}
  end

  def direction(%MarsRover{x_coord: x_coord, y_coord: y_coord, direction: 'E'} ,'R') do
    %MarsRover{x_coord: x_coord, y_coord: y_coord, direction: 'S'}
  end

  def direction(%MarsRover{x_coord: x_coord, y_coord: y_coord, direction: 'W'} ,'L') do
    %MarsRover{x_coord: x_coord, y_coord: y_coord, direction: 'S'}
  end

  def direction(%MarsRover{x_coord: x_coord, y_coord: y_coord, direction: 'W'} ,'L') do
    %MarsRover{x_coord: x_coord, y_ coord: y_coord, direction: 'N'}
  end

  def direction(%MarsRover{x_coord: x_coord, y_coord: y_coord, direction: 'N'} ,'L') do
    %MarsRover{x_coord: x_coord, y_coord: y_coord, direction: 'W'}
  end

  def direction(%MarsRover{x_coord: x_coord, y_coord: y_coord, direction: 'N'} ,'R') do
    %MarsRover{x_coord: x_coord, y_coord: y_coord, direction: 'E'}
  end

  def move(rover, instructions) do
    instruction_list = String.split(instructions, "", trim: true)
    Enum.each instruction_list, fn instruction ->
      rover = direction(rover, instruction)
    end
  end

end


defmodule Main do
  def main do
    rover = %MarsRover{x_coord: 1, y_coord: 2, direction: 'E'}
    MarsRover.move(rover,"L")
    IO.inspect rover
    # MarsRover.move("LMLMLMLMM")
  end
end

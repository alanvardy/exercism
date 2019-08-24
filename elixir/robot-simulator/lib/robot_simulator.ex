defmodule RobotSimulator do
  @directions [:north, :east, :south, :west]

  defguardp valid_position(x, y) when is_integer(x) and is_integer(y)
  defguardp valid_direction(direction) when direction in @directions

  @doc """
  Create a Robot Simulator given an initial direction and position.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec create(direction :: atom, position :: {integer, integer}) :: any
  def create(direction \\ :north, position \\ {0, 0})

  def create(direction, _position) when not valid_direction(direction) do
    {:error, "invalid direction"}
  end

  def create(direction, {x, y} = position) when valid_position(x, y) do
    %{direction: direction, position: position}
  end

  def create(_direction, _position) do
    {:error, "invalid position"}
  end

  @doc """
  Simulate the robot's movement given a string of instructions.

  Valid instructions are: "R" (turn right), "L", (turn left), and "A" (advance)
  """
  @spec simulate(robot :: any, instructions :: String.t()) :: any
  def simulate(robot, instructions) do
    instructions
    |> String.split("", trim: true)
    |> move(robot)
  end

  defp move([], robot), do: robot
  defp move(_instructions, {:error, "invalid instruction"} = robot), do: robot

  defp move([head | tail], robot) do
    robot =
      case head do
        "R" -> turn(:right, robot)
        "L" -> turn(:left, robot)
        "A" -> advance(robot)
        _ -> {:error, "invalid instruction"}
      end

    move(tail, robot)
  end

  defp turn(turn_to, %{direction: direction} = robot) do
    new_direction =
      case {turn_to, direction} do
        {:right, :north} -> :east
        {:right, :east} -> :south
        {:right, :south} -> :west
        {:right, :west} -> :north
        {:left, :north} -> :west
        {:left, :east} -> :north
        {:left, :south} -> :east
        {:left, :west} -> :south
      end

    %{robot | direction: new_direction}
  end

  defp advance(%{direction: direction, position: {x, y}} = robot) do
    new_position =
      case direction do
        :north -> {x, y + 1}
        :east -> {x + 1, y}
        :south -> {x, y - 1}
        :west -> {x - 1, y}
      end

    %{robot | position: new_position}
  end

  @doc """
  Return the robot's direction.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec direction(robot :: any) :: atom
  def direction(%{direction: direction}), do: direction

  @doc """
  Return the robot's position.
  """
  @spec position(robot :: any) :: {integer, integer}
  def position(%{position: position}), do: position
end

defmodule Utils do
  def get_data do
    {:ok, data} = File.read("../../day1_input.txt")

    data
    |> String.trim()
    |> String.split()
    |> Enum.map(&String.to_integer/1)
  end

  def calculate(mass) do
    mass
    |> Kernel./(3)
    |> Float.floor()
    |> Kernel.trunc()
    |> Kernel.-(2)
  end
end

defmodule Day1_2 do
  def run do
    Utils.get_data()
    |> calculate_fuel_requirement_for_mass_including_fuel
    |> IO.inspect()
  end

  def calculate_fuel_requirement_for_mass_including_fuel(mass_list) do
    calculate_fuel_requirement_including_fuel(mass_list, 0)
  end

  defp calculate_fuel_requirement_including_fuel([], total_fuel) do
    total_fuel
  end

  defp calculate_fuel_requirement_including_fuel([mass | mass_list], total_fuel) do
    fuel_required = total_fuel + calculate(mass, [])

    calculate_fuel_requirement_including_fuel(mass_list, fuel_required)
  end

  defp calculate(new_mass, [_ | total_fuel]) when new_mass <= 0 do
    total_fuel
    |> Enum.sum()
  end

  defp calculate(mass, total_fuel) do
    fuel_required = Utils.calculate(mass)

    calculate(fuel_required, [fuel_required | total_fuel])
  end
end

defmodule Day1_1 do
  def run do
    Utils.get_data()
    |> calculate_fuel_requirement_for_mass
    |> IO.inspect()
  end

  def calculate_fuel_requirement_for_mass(mass_list) do
    calculate_fuel_requirement(mass_list, 0)
  end

  defp calculate_fuel_requirement([], total_fuel) do
    total_fuel
  end

  defp calculate_fuel_requirement([mass | mass_list], total_fuel) do
    fuel_required = calculate(mass)

    calculate_fuel_requirement(mass_list, total_fuel + fuel_required)
  end

  defp calculate(mass), do: Utils.calculate(mass)
end

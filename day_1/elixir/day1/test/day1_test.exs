defmodule Day1Test do
  use ExUnit.Case

  test "calculates fuel required based on mass" do
    assert Day1_1.calculate_fuel_requirement_for_mass([12]) === 2
    assert Day1_1.calculate_fuel_requirement_for_mass([12, 14]) === 4
    assert Day1_1.calculate_fuel_requirement_for_mass([1969]) === 654
    assert Day1_1.calculate_fuel_requirement_for_mass([100_756]) === 33583
  end

  test "calculates the fuel required, including the mass of the fuel" do
    assert Day1_2.calculate_fuel_requirement_for_mass_including_fuel([12]) === 2
    assert Day1_2.calculate_fuel_requirement_for_mass_including_fuel([12, 14]) === 4
    assert Day1_2.calculate_fuel_requirement_for_mass_including_fuel([1969]) === 966
  end
end

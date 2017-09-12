defmodule PizzademoTest do
  use ExUnit.Case
  doctest Pizzademo

  test "greets the world" do
    assert Pizzademo.hello() == :world
  end
end

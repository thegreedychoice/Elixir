defmodule TestelixirTest do
  use ExUnit.Case
  doctest Testelixir

  test "greets the world" do
    assert Testelixir.hello() == :world
  end

  test "division" do
    {:ok, result} = Testelixir.div(2,1)
    assert result == 2.0
  end

  test "division by zero" do
    {:error, err} = Testelixir.div(2,0)
    assert err == "Attempt to do division by 0"
  end

  test "pipes and strings" do
  	import String

  	val = 
  		"shubh"
  		|>reverse
  		|>capitalize
  		|>reverse

  	assert val == "shubH"
  end
end


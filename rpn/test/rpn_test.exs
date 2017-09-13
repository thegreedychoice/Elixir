defmodule RpnTest do
  use ExUnit.Case
  doctest Rpn

  test "greets the world" do
    assert Rpn.hello() == :world
  end

  test "starts with an empty stack" do
  	{:ok, pid} = Rpn.start
  	assert Rpn.peek(pid) == []
  end
  test "pushing onto the stack" do
  	{:ok, pid} = Rpn.start
  	assert :ok == Rpn.push(pid, 5)
  	assert Rpn.peek(pid) == [5]
  	assert :ok == Rpn.push(pid, 1)
  	assert Rpn.peek(pid) == [1,5]
  end
  test "add" do
  	{:ok, pid} = Rpn.start
  	assert :ok == Rpn.push(pid, 5)
  	assert :ok == Rpn.push(pid, 1)
  	assert :ok == Rpn.push(pid, :+)
  	assert Rpn.peek(pid) == [6]
  end
  test "subtract" do
  	{:ok, pid} = Rpn.start
  	assert :ok == Rpn.push(pid, 5)
  	assert :ok == Rpn.push(pid, 1)
  	assert :ok == Rpn.push(pid, :-)
  	assert Rpn.peek(pid) == [4]
  end
  test "multiply" do
  	{:ok, pid} = Rpn.start
  	assert :ok == Rpn.push(pid, 5)
  	assert :ok == Rpn.push(pid, 2)
  	assert :ok == Rpn.push(pid, :*)
  	assert Rpn.peek(pid) == [10]
  end
  test "divide-" do
  	{:ok, pid} = Rpn.start
  	assert :ok == Rpn.push(pid, 5)
  	assert :ok == Rpn.push(pid, 2)
  	assert :ok == Rpn.push(pid, :/)
  	assert Rpn.peek(pid) == [2.5]
  end
  test "wikipedia example" do
    {:ok, pid} = Rpn.start
    assert :ok == Rpn.push(pid, 5)
    assert :ok == Rpn.push(pid, 1)
    assert :ok == Rpn.push(pid, 2)
    assert :ok == Rpn.push(pid, :+)
    assert :ok == Rpn.push(pid, 4)
    assert :ok == Rpn.push(pid, :*)
    assert :ok == Rpn.push(pid, :+)
    assert :ok == Rpn.push(pid, 3)
    assert :ok == Rpn.push(pid, :-)
    assert Rpn.peek(pid) == [14]
  end
end

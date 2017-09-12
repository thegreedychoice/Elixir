defmodule StatefulProcessesTest do
  use ExUnit.Case
  doctest StatefulProcesses

  test "greets the world" do
    assert StatefulProcesses.hello() == :world
  end

  test "getting the value" do
  	{:ok, pid} = Counter.start(0)
  	assert {:ok, 0} = Counter.get_value(pid)
  end

  test "incrementing the value" do
  	{:ok, pid} = Counter.start(0)
  	assert :ok = Counter.increment(pid)
  	assert {:ok, 1} = Counter.get_value(pid)
  	assert :ok = Counter.increment(pid)
  	assert {:ok, 2} = Counter.get_value(pid)
  end

    test "decrementing the value" do
  	{:ok, pid} = Counter.start(0)
  	assert :ok = Counter.decrement(pid)
  	assert {:ok, -1} = Counter.get_value(pid)
  	assert :ok = Counter.decrement(pid)
  	assert {:ok, -2} = Counter.get_value(pid)
  end

   test "getting the value from Agent" do
  	{:ok, pid} = CounterAgent.start(0)
  	assert {:ok, 0} = CounterAgent.get_value(pid)
  end

  test "incrementing the value from Agent" do
  	{:ok, pid} = CounterAgent.start(0)
  	assert :ok = CounterAgent.increment(pid)
  	assert {:ok, 1} = CounterAgent.get_value(pid)
  	assert :ok = CounterAgent.increment(pid)
  	assert {:ok, 2} = CounterAgent.get_value(pid)
  end

    test "decrementing the value from Agent" do
  	{:ok, pid} = CounterAgent.start(0)
  	assert :ok = CounterAgent.decrement(pid)
  	assert {:ok, -1} = CounterAgent.get_value(pid)
  	assert :ok = CounterAgent.decrement(pid)
  	assert {:ok, -2} = CounterAgent.get_value(pid)
  end
end

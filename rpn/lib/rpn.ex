defmodule Rpn do
  @moduledoc """
  Documentation for Rpn.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Rpn.hello
      :world

  """
  def hello do
    :world
  end

  def start do
    pid = spawn(__MODULE__, :loop, [[]])
    {:ok, pid}
  end

  def loop(stack) do
    receive do
      {from, ref, :peek} ->
       send(from, {ref, stack})
       loop(stack)
      {:push, :+} ->
        [second | [first | rest ]] = stack
        loop([first + second | rest])
      {:push, :-} ->
        [second | [first | rest ]] = stack
        loop([first - second | rest])
      {:push, :*} ->
        [second | [first | rest ]] = stack
        loop([first * second | rest])
      {:push, :/} ->
        [second | [first | rest ]] = stack
        loop([first / second | rest])
      {:push, val} -> loop([val | stack])
       
    end
  end

  def peek(pid) do
    ref = make_ref()
    send(pid, {self(), ref, :peek})
    receive do
      {^ref, stack} -> stack 
    end
  end 

  def push(pid, value) do
    send(pid, {:push, value}) 
    :ok 
  end
end

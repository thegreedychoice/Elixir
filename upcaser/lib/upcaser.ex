defmodule Upcaser do
  @moduledoc """
  Documentation for Upcaser.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Upcaser.hello
      :world

  """
  def hello do
    :world
  end

  def start do
    pid = spawn(Upcaser, :loop, [])
    {:ok, pid}
  end

  def loop do
    receive do
      {from, ref, {:upcase, str}} -> send(from, {:ok, ref, String.upcase(str)})
    end
    loop()
  end

  #This public function will create a structure of message that needs to be send to the service
  #and then sends it as well.
  def upcase(server_pid, str) do
    ref = make_ref()
    #pass a unique reference variable
    send(server_pid, {self(), ref, {:upcase, str}})
    #Then we will block and wait to get a response and then return it
    receive do
      {:ok, ^ref, str} -> {:ok, str}
    end

  end
end

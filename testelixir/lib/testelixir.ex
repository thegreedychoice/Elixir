defmodule Testelixir do
  @moduledoc """
  Documentation for Testelixir.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Testelixir.hello
      :world

  """
  def hello do
    :world
  end

  def div(a,0) do
    {:error, "Attempt to do division by 0"}
  end
    def div(a,b) do
    {:ok, a / b}
  end

end



defmodule UpcaserTest do
  use ExUnit.Case
  doctest Upcaser

  test "greets the world" do
    assert Upcaser.hello() == :world
  end

  test "starting the service" do
  	#assert if it returns a 2-tuple
  	assert {:ok, upcaser_pid} = Upcaser.start
  	#assert if its a process id
  	assert is_pid(upcaser_pid)
  end

  test "sending the string message to be upcased" do
  	#start the service
  	{:ok, upcaser_id} = Upcaser.start
	assert {:ok, "SHUBH"} = Upcaser.upcase(upcaser_id, "shubh")
  end
end

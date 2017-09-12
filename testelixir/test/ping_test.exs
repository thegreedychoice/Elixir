defmodule PingTest do
	use ExUnit.Case
	doctest Ping
 	#testing the messaging 
  	test "it responds to a :pong with a :ping" do
  	#In this test we spawn a process build around `start` from the `Ping` module first,
  	#and then send a message `:pong` to this spawned process. 
  	#In the `start` method of the `Ping` module, we have defined a receive which would 
  	#deal with this incoming message and respond with the defined respone.
  	#spawn takes module name, function name and the set of arguments
  	ping = spawn(Ping, :start, []) 
  	send(ping, {:pong, self()})
  	#assert_receive checks to see if we have received a specific pattern of message, in this case `:pong`
  	#in 100ms, and if received by then, it passes or else fails.
  	assert_receive{:ping, ^ping}
  end

  test "it responds to multiple messages" do
  	ping = spawn(Ping, :start, [])
  	send(ping, {:pong, self()})
  	assert_receive{:ping, ^ping}
  	send(ping, {:pong, self()})
  	assert_receive{:ping, ^ping}
  	send(ping, {:pong, self()})
  	assert_receive{:ping, ^ping}
  	send(ping, {:pong, self()})
  	assert_receive{:ping, ^ping}
  	send(ping, {:pong, self()})
  	assert_receive{:ping, ^ping}

  end

end
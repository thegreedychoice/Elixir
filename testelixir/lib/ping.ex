defmodule Ping do
	def start do
		loop2()
	end

	def loop() do
		#receive pattern matches on a series of potential messages coming from a process
		#and then runs some code in response once it matches positively. We use send to send a message to 
		#the process that contacted receive.
		#self() gives the current process ID, in this case `start`
		receive do
			{:pong, from} -> send(from, {:ping, self()})
		end
		#Processes have a mailbox, and any messages sent to a process queue up in a list in the 
		#mailbox. receive will look at the mailbox, and handle the first message it finds in the 
		#order specified in the call to receive. 
		#If there are no messages, it blocks until there is a message.

		#Then call loop again and the function is active again.
		loop()
	end

	def loop2() do
		receive do
			{:pong, from} -> 
				IO.puts "ping ->" 
				:timer.sleep 500 
				send(from, {:ping, self()})

			{:ping, from} -> 
				IO.puts "            <-pong" 
				:timer.sleep 500 
				send(from, {:pong, self()})
		end
		loop2()
	end
end
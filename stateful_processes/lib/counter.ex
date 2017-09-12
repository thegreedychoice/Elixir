defmodule Counter do
	def start(initial_value) do
		pid = spawn(Counter, :loop, [initial_value])
		{:ok, pid}
	end

	def loop(value) do
		#This method waits for a request and then returns the value of the counter.
		receive do
			{from, ref, :get_value} -> send(from, {:ok, ref, value})
			loop(value)

			:increment ->
				loop(value + 1)

			:decrement ->
				loop(value - 1)
		end
	end

	def increment(pid) do
		send(pid, :increment)
		:ok
	end

	def decrement(pid) do
		send(pid, :decrement)
		:ok
	end

	def get_value(pid) do
		#This function sends a request to the pid to get its counter value
		#and sends a unique ref to identify the request
		ref = make_ref()
		send(pid, {self(), ref, :get_value})
		receive do
			{:ok, ^ref, val} -> {:ok, val}
		end
	end
end
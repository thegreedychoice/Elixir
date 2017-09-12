defmodule Account do
	def balance(initial, spending) do
		current_bal = initial - spending
		IO.puts "Current Balance : $#{current_bal}"
	end
end
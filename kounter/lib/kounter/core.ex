defmodule Kounter.Core do
  defstruct [kount: 0]

	def new(val \\ 0) when is_integer(val) do
		%__MODULE__{kount: val}
	end

	def inc(%__MODULE__{kount: val}=new_kounter) do
		%{new_kounter | kount: val + 1}
	end

	def dec(%__MODULE__{kount: val}=new_kounter) do
		%{new_kounter | kount: val - 1}
	end

	def add(%__MODULE__{kount: val}=new_kounter, x) when is_integer(x) do
		%{new_kounter | kount: val + x}
	end

	def show(data) do
		inspect data.kount
	end
end

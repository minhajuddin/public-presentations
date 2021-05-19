## Modules and functions

# defmodule Greet do
  # def hi(name) do
    # IO.puts "Hello, #{name} 👋"
  # end
# end
#
# Greet.hi "Tom"

defmodule NumberToString do
  def convert(num) do
    nums = Integer.digits(num) # => (123) => [1, 2, 3]

    nums |> Enum.map(fn n -> string(n) end) |> Enum.join(" ")
  end

  def string(0), do: "zero"
  def string(1), do: "one"
  def string(2), do: "two"
  def string(n) when is_number(n), do: "number-#{n}"
end

# IO.puts NumberToString.convert(123445)
IO.puts NumberToString.string("foo")

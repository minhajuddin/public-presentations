# Pipes
IO.puts(Enum.max([3, 4]))

# is the same as

[3, 4, 5]
|> Enum.max
|> IO.puts

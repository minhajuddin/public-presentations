defmodule Worker do
  def work(id) do
    # IO.puts "Working ... for #{inspect id}"
    :timer.sleep(2) # ms
    # IO.puts "All done"
  end
end

a = 33

{time, _ } = :timer.tc(fn ->
  Enum.each(1..1000_000, fn user_id ->
    pid = spawn(fn ->

      Worker.work(user_id)
      a = 55

    end)
    # IO.puts "Working in #{inspect pid} for #{user_id}"
  end)
end)

:timer.sleep(1000)

IO.puts "--------------------"
IO.puts "TIME TAAKEN : #{time}"
IO.puts "--------------------"

# 1  2   3  4  5... 1000


# 8
# 8 threads

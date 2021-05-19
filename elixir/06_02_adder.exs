defmodule Adder do
  def start() do
    IO.puts "starting adder pid: #{inspect self()}"
    loop()
  end

  def loop() do
    receive do
      {:add, n1, n2} -> IO.puts "Sum of #{n1} and #{n2} is #{n1 + n2}"
    end

    loop() # Tail recursive call 
  end
end

adder_pid = spawn(Adder, :start, [])

send(adder_pid, {:add, 1, 4})
send(adder_pid, {:add, 3, 4})

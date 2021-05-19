defmodule HttpServer do
  def start_link(port \\ 4041) do
    {:ok, sock} = :gen_tcp.listen(port)
    spawn(__MODULE__, )
  end
end

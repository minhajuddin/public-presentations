{:ok, conn} = :gen_tcp.connect('putty.minhajuddin.com', 80, [:binary, {:active, false}])

:gen_tcp.send(conn,
  "GET / HTTP/1.1\r\nHost: putty.minhajuddin.com\r\nUser-Agent: curl/7.68.0\r\nAccept: */*\r\n\r\n"
) |> IO.inspect(label: "GENTCP SEND")

:gen_tcp.recv(conn, 0, 5000) |> IO.inspect(label: "GENTCP RECV")

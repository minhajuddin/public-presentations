# What's in an HTTP Request?

## Use https://httpbin.org/ as a test server in these requests

# Slide 1

## What's in an HTTP Request?
  - Quote by William Shakespeare with his picture

# Slide 2
  - A lot of people use a variation of what happens when you type google.com in
  your browser.

  - Do you know what happens when you make an HTTP request from your app to a
    different server?

# Slide 3
  - Metrics showing number of connections on the server and its consumption
  - Test sending out multiple requests to a server by using one off connections?
  - What is the limit to the number of outgoing HTTP requests from a single
    computer?
  - What does HTTP 1.1 run on top of? TCP? UDP?
  - Look at the time taken to find the optimum tcp window size?

  - When to use HTTP connection pools?
  - When NOT to use HTTP connection pools?
  - Problems that you might run into while using connection pools:
    - Server closes the connection and you send data on the connection.

  - A connection pool using the new Mint package

  - Benchmark using a connection pool
  - Benchmark without using a connection pool


- - -
4. An HTTP connection's lifecycle with wire shark?
  - What happens when you make a request from ruby?

1. Database connection example in a simple rails controller
2. Show an example containing HTTParty GET request to a microservice and ask if
   they see a problem with the code.
3. Why do we treat HTTP connections differently?



Use the example and pictures showing the TCP handshake
And SSL handshake
Wireshark screenshots

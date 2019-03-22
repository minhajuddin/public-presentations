require 'excon'
require 'benchmark'

# SHOW WIRESHARK
n = 100
url = 'http://localhost:4000'

c1 = -> { Excon.new(url, path: '/?size=1kb', persistent: true) }
cp1 = -> { Excon.new(url, path: '/?size=1kb', persistent: true) }

Benchmark.bm do |b|
  #b.report('-10^3') { n.times { Excon.get "#{url}/?size=1kb" } }
  #b.report('+10^3') { c1 = c1.call; n.times { c1.get } }
  b.report('=10^3') do
    cp1 = cp1.call
    reqs = n.times.map { { method: :get } }
    cp1.batch_requests(reqs)
  end
end

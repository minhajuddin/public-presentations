require 'excon'
require 'benchmark'

# SHOW WIRESHARK

n = 50
url = 'http://localhost:4000'


c1 = -> { Excon.new(url, path: '/?size=1kb', persistent: true) }
c2 = -> { Excon.new(url, path: '/?size=10kb', persistent: true) }
c3 = -> { Excon.new(url, path: '/?size=100kb', persistent: true) }
c4 = -> { Excon.new(url, path: '/?size=1000kb', persistent: true) }

Benchmark.bm do |b|
  b.report('-10^3') { n.times { Excon.get "#{url}/?size=1kb" } }
  b.report('+10^3') { c1 = c1.call; n.times { c1.get } }

  b.report('-10^4') { n.times { Excon.get "#{url}/?size=10kb" } }
  b.report('+10^4') { c2 = c2.call; n.times { c2.get } }

  b.report('-10^5') { n.times { Excon.get "#{url}/?size=100kb" } }
  b.report('+10^5') { c3 = c3.call; n.times { c3.get } }

  b.report('-10^6') { n.times { Excon.get "#{url}/?size=1000kb" } }
  b.report('+10^6') { c4 = c4.call; n.times { c4.get } }
end

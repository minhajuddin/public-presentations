require 'excon'
require 'benchmark'

url = 'http://localhost:4000'

n = 10
c1 = Excon.new(url, path: '/?size=1kb', persistent: true)
c2 = Excon.new(url, path: '/?size=10kb', persistent: true)
c3 = Excon.new(url, path: '/?size=100kb', persistent: true)
c4 = Excon.new(url, path: '/?size=1000kb', persistent: true)

# SHOW WIRESHARK
Benchmark.bm do |b|
  b.report('10^3') { n.times { c1.get } }
  b.report('10^4') { n.times { c2.get } }
  b.report('10^5') { n.times { c3.get } }
  b.report('10^6') { n.times { c4.get } }
end

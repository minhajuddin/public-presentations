require 'excon'
require 'benchmark'

# SHOW WIRESHARK

n = 10
url = 'http://localhost:4000'

Benchmark.bm do |b|
  b.report('10^3') { n.times { Excon.get "#{url}/?size=1kb" } }
  b.report('10^4') { n.times { Excon.get "#{url}/?size=10kb" } }
  b.report('10^5') { n.times { Excon.get "#{url}/?size=100kb" } }
  b.report('10^6') { n.times { Excon.get "#{url}/?size=1000kb" } }
end

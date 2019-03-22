require 'excon'
require 'benchmark'

def bench(&block)
  result = Benchmark.measure(&block)
  puts [result.real, result.total].map { |x| x * 1000 }.join("\t")
end

# SHOW WIRESHARK
puts "real(ms)\t\ttotal(ms)"
bench { Excon.get('http://localhost:4000') }

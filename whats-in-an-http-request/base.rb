require 'excon'
require 'benchmark'

def bench(&block)
  result = Benchmark.measure(&block)
  puts [result.real, result.total].map { |x| x * 1000 }.join("\t")
end

puts "real(ms)\t\ttotal(ms)"

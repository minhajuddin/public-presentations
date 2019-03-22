require 'excon'
require 'benchmark'
require 'connection_pool'

# SHOW WIRESHARK

n = 100
url = 'http://localhost:4000'

thread_count = 4

http_pool = ConnectionPool.new(size: 10) { Excon.new(url, persistent: true) }

Benchmark.bm do |b|
  b.report('-') do
    thread_count.times.map do
      Thread.new { n.times { Excon.get "#{url}/?size=1kb" } }
    end.each(&:join)
  end
  b.report('+') do
    thread_count.times.map do
      Thread.new do
        n.times do
          http_pool.with do |conn|
            conn.get(query: { size: '10kb' })
          end
        end
      end
    end.each(&:join)
  end
end

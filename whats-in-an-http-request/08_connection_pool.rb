require 'connection_pool'

class FakeConnection
  @id_seq = 0
  def self.next_id
    @id_seq += 1
  end
  def initialize
    @id = FakeConnection.next_id
    puts "created #{self}"
  end
  def to_s
    "<FakeConnection ID##{@id}>"
  end
end

pool = ConnectionPool.new { FakeConnection.new }

puts "1.\n--------------------"
pool.with do |conn|
  puts "pool size: #{pool.size} available connections: #{pool.available}"
  # ... using connection
  puts "finished using connection #{conn}"
end

puts "2.\n--------------------"
10.times.each do
  pool.with do |conn|
    puts "pool size: #{pool.size} available connections: #{pool.available}"
    # ... using connection
    puts "finished using connection #{conn}"
  end
end
exit

puts "3.\n--------------------"
10.times.map do
  Thread.new do
    pool.with do |conn|
      puts ">#{Thread.current.object_id}"
      puts "pool size: #{pool.size} available connections: #{pool.available}"
      #... using connection
      puts "finished using connection #{conn}"
      puts "<#{Thread.current.object_id}"
    end
  end
end.each(&:join)

puts "4.\n--------------------"
20.times.map do |i|
  Thread.new do
    pool.with do |conn|
      puts "thread[#{i}] pool size: #{pool.size} available connections: #{pool.available}"
      # ... using connection
      sleep 2

      puts "thread[#{i}]finished using connection #{conn}"
      puts ''
    end
  end
end.each(&:join)

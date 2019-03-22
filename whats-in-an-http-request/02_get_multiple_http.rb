require_relative './base'

# SHOW WIRESHARK
bench do
  3.times.each { Excon.get 'http://localhost:4000' }
end

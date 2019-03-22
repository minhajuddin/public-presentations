require_relative './base'

# SHOW WIRESHARK
bench do
  3.times.each { Excon.get 'https://ampleorganics.com' }
end

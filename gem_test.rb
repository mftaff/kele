require 'kele'

kele_client = Kele.new('mtaffel422@gmail.com', '1AZ04#87nop')

puts "  >>> kele_client: #{kele_client.inspect}"

puts kele_client.get_checkpoint(1848)
# puts kele_client.get_roadmap
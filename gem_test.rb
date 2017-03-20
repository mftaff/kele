require 'kele'

kele_client = Kele.new('mtaffel422@gmail.com', '1AZ04#87nop')

puts "  >>> kele_client: #{kele_client.inspect}"

# puts kele_client.get_checkpoint(1848) # param:checkpoint_id - gets a specific checkpoint *required*
# puts kele_client.get_roadmap
# puts kele_client.get_messages(1) # param:page_num - gets a specific page *leave blank to return all pages*
# puts kele_client.create_message("test subject string", "Hi! This is a test message send from kele.")

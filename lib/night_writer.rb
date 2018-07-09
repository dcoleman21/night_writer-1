require_relative "./braille"

handle = File.open(ARGV[0], "r")
incoming_text = handle.read
handle.close

braille = Braille.new
text = incoming_text


writer = File.open(ARGV[1], "w")
writer.write(text)
writer.close

puts "Created #{ARGV[1]} containing #{text.strip.length} characters"

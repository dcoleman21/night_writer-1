handle = File.open(ARGV[0], "r")

incoming_text = handle.read

handle.close

text = incoming_text

count = text.strip.length

writer = File.open(ARGV[1], "w")

writer.write(text)

writer.close

puts "Created #{ARGV[1]} containing #{count} characters"

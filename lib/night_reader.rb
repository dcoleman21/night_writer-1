require_relative "./english_converter"

handle = File.open(ARGV[0], "r")
incoming_text = handle.read.chomp
handle.close

english = EnglishConverter.new


writer = File.open(ARGV[1], "w")
writer.write(english.translate(incoming_text))
writer.close

puts "Created #{ARGV[1]} containing #{incoming_text.length / 6} characters"

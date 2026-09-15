books = [
  "The Hunger Games",
  "Catching Fire",
  "System Design Interview",
  "Cracking the Coding Interview",
  "Grokking the Coding Interview"
]

books.each do |title|
  Book.find_or_create_by!(title: title)
end

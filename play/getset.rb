class Book
  attr_accessor :author
  attr_reader :title
  attr_writer :comments
  def initialize(author, title)
    @author = author
    @title = title
    @comments = []
  end
end
book = Book.new("Chuck Palahniuk", "Fight Club")
book = Book.new("Chuck Palahniuk", "Fight Club")

#returns error
#book.title = "Cooking Club"
#book.comments.each { |comment| puts comment }
#book.comments << "#{book.title} was a good book"

# no error returned
"#{book.title} was written by #{book.author}."

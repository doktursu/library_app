class Person

  attr_reader :name, :books

  def initialize(name, pin = nil)
    @name = name
    @pin = pin
    @books = {}
  end

  def format
    "name:\t#{@name}\nbooks:\t#{@books.length}\n#{list_borrowed_books}"
  end

  #  ## WORKS WITH LIBRARY.LEND
  # def borrow(book_title, library = nil, book = nil)
  #   # GET BOOK FROM LIBRARY
  #   if library
  #     book = library.books[book_title]
  #     library.lend(book_title, @name)
  #   end
  #   # ONLY FOR WHEN LIBRARY CALLS, ADDS BOOK TO PERSON
  #   if book
  #     @books[book.title] = book
  #   end
  # end

  ## SIMPLE
  def add_book(book)
    # book.due_date = Date.today + 14
    @books[book.title] = book
  end

  def return(book_title, library = nil)
    library.receive(book_title, @name) if library
    @books.delete(book_title)
  end

  def list_borrowed_books
    if @books.empty?
      "#{@name} has no borrowed books"
    else
      book_strings = @books.map { |key, book| book.format }
      book_strings.join("\n\n")
    end
  end

end
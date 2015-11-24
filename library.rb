class Library

  attr_reader :name, :books, :books_out, :people

  def initialize(name)
    @name = name
    @books = {}
    @books_out = {}
    @people = {}
  end

  def add_book(*books_to_add)
    books_to_add.each do |book|
      @books[book.title] = book
    end
  end

  def add_person(*persons)
    persons.each { |person| @people[person.name] = person }
  end

  # ## WORKS WITH PERSON.BORROW
  # def lend(book_title, person_name)
  #   person = @people[person_name]
  #   book = @books.delete(book_title)
  #   @books_out[book.title] = book
  #   # ADD BOOK TO PERSON
  #   person.borrow(book.title, nil, book)
  # end

  def lend(book_title, person_name)
    person = @people[person_name]
    book = @books.delete(book_title)
    @books_out[book.title] = book
    person.add_book(book)
  end

  def receive(book_title, person_name)
    person = @people[person_name]
    book = person.return(book_title)
    @books_out.delete(book.title)
    add_book(book)
  end

  def list_books
    if @books.empty?
      "There are no books in the library at present"
    else
      book_strings = @books.map { |key, book| book.format }
      book_strings.join("\n\n")
    end
  end

  def list_books_of_genre(genre)
    selected_books = @books.select { |key, book| book.genre == genre }
    book_strings = selected_books.map { |key, book| book.format }
    book_strings.join("\n\n")
  end

  def list_books_out_of_genre(genre)
    book_strings = @books_out.select { |key, book| book.genre == genre }.map { |key, book| book.format }
    book_strings.join("\n\n")
  end


  def list_books_out
    if @books_out.empty?
      "There are no books out of the library at present"
    else
      book_strings = @books_out.map { |key, book| book.format }
      book_strings.join("\n\n")
    end
  end

  def list_accounts_details
    if @people.empty?
      "There are no people signed up to the library at present"
    else
      people_strings = @people.map { |key, person| person.format }
      people_strings.join("\n\n")
    end
  end

  def list_people
    if @people.empty?
      "There are no people signed up to the library at present"
    else
      people_strings = @people.map { |key, person| person.name }
      people_strings.join("\n\n")
    end
  end

  def list_borrowers_and_books
    # borrowers_strings = @people.map { |key, person| person.name + ":\n" + person.list_borrowed_books unless person.books.empty? }
    borrowers_strings = @people.select { |key, person| person.books.any? }.map { |key, person| person.format }
    borrowers_strings.join("\n\n")
  end


  #######################################

  def checkout_book(person)
    if books.empty?
      puts "All books in the library are checked out."
    else
      while true
        book_title = prompt "Enter a title to checkout (Case-sensitive / 0 to exit): "
        break if book_title == '0'
        if books.has_key?(book_title)
          lend(book_title, person.name)
          puts "\n"
          puts "Successfully checked out #{book_title}."
          puts person.format
          break
        elsif person.books.has_key?(book_title)
          puts "You already have #{book_title} checked out."
        elsif books_out.has_key?(book_title)
          puts "#{book_title} is currently checked out."
        else
          puts "Book title invalid. Please try again."
        end
        puts "\n"
      end
    end
  end

  def return_book(person)
    puts person.format
    puts "\n"
    if person.books.empty?
      puts "You have no books to return."
    else
      while true
        book_title = prompt "Enter a title to return (Case-sensitive / 0 to exit): "
        break if book_title == '0'
        if person.books.has_key?(book_title)
          receive(book_title, person.name)
          puts "\n"
          puts "Successfully returned #{book_title}."
          puts person.format
          break
        else
          puts "Book title invalid. Please try again."
        end
        puts "\n"
      end
    end
  end

  def explore_genres

    while true
      puts "Select a genre (0 to exit):\tFantasy | Fiction | Science Fiction"
      puts "\t\t\t\tNon-Fiction | History"
      genre = gets.chomp.downcase.strip
      puts "\n"
      break if genre == '0'
      case genre
      when 'fantasy'
        genre = 'Fantasy'
        break
      when 'fiction'
        genre = 'Fiction'
        break
      when 'science fiction'
        genre = 'Science Fiction'
        break
      when 'non-fiction'
        genre = 'Non-Fiction'
        break
      when 'history'
        genre = 'History'
        break
      else
        puts "Genre invalid. Please try again"
        puts "\n"
      end
    end
    unless genre == '0'
      header "#{genre}"
      header "Available books"
      puts list_books_of_genre(genre)
      puts "\n"
      header "Unavailable books"
      puts list_books_out_of_genre(genre)
    end
  end

  private
  def header(string)
    string.upcase!
    puts "----#{string}------------"
    puts "\n"
  end

end
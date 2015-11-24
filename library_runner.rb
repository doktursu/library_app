require "pry-byebug"
require_relative "library"
require_relative "book"
require_relative "person"


#TODO: create library
library = Library.new('CodeClan Library')


#TODO: create book
#TODO: add book to library
book1 = Book.new({title: 'Errand', genre: 'Fantasy'})
book2 = Book.new({title: 'Eragon', genre: 'Fantasy'})
library.add_book(book1, book2)

library.add_book(Book.new(title: "The Hobbit", genre: "Fantasy"))
library.add_book(Book.new(title: "Feersum Endjinn", genre: "Science Fiction"))
library.add_book(Book.new(title: "Histories", genre: "History"))
library.add_book(Book.new(title: "To Kill a Mockingbird", genre: "Fiction"))
library.add_book(Book.new(title: "A Brief History of Time", genre: "Non-Fiction"))

puts Book.count
puts "\n"


#TODO: list the books out
puts "--Books out of library-----\n\n#{library.list_books_out}"
puts "\n"


#TODO: list the books
puts "--Books in library-----\n\n#{library.list_books}"
puts "\n"


#TODO: create person
#TODO: add person to library
person1 = Person.new('Joe')
library.add_person(person1)

library.add_person(Person.new('Fred'))
library.add_person(Person.new('Wilma'))
library.add_person(Person.new('Barney'))
library.add_person(Person.new('Betty'))

# LENDING AND BORROWING BOOKS
wilma = library.people['Wilma']

#TODO: lend book
library.lend('To Kill a Mockingbird', 'Barney')
# wilma.borrow('The Hobbit', library)
# wilma.borrow('Histories', library)
library.lend('The Hobbit', 'Wilma')
library.lend('Histories', 'Wilma')

#TODO: list wilma's borrowed books
wilmas_borrowed_books = wilma.list_borrowed_books
puts "--Books borrowed by #{wilma.name}-----\n\n#{wilmas_borrowed_books}"
puts "\n"

#TODO: list people
members = library.list_people
puts "--Library members-----\n\n#{members}"
puts "\n"

#TODO: return book
# library.receive(book_title, person_name)
wilma.return('The Hobbit', library)

#TODO: list borrowers and books out
borrowers_and_books = library.list_borrowers_and_books
puts "--All borrowers and books out-----\n\n#{borrowers_and_books}"
puts "\n"

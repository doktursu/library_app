require "pry-byebug"
require "io/console"

require_relative "library"
require_relative "person"
require_relative "book"

library = Library.new('CodeClan Library')

library.add_book(Book.new(title: "The Hobbit", genre: "Fantasy"))
library.add_book(Book.new(title: "Feersum Endjinn", genre: "Science Fiction"))
library.add_book(Book.new(title: "Histories", genre: "History"))
library.add_book(Book.new(title: "To Kill a Mockingbird", genre: "Fiction"))
library.add_book(Book.new(title: "A Brief History of Time", genre: "Non-Fiction"))

library.add_book(Book.new(title: "Eragon", genre: "Fantasy"))
library.add_book(Book.new(title: "Jurassic Park", genre: "Science Fiction"))
library.add_book(Book.new(title: "Guns, Germs, and Steel", genre: "History"))
library.add_book(Book.new(title: "Hamlet", genre: "Fiction"))
library.add_book(Book.new(title: "The Science Delusion", genre: "Non-Fiction"))

library.add_book(Book.new(title: "Harry Potter and the Sorcerer's Stone", genre: "Fantasy"))
library.add_book(Book.new(title: "Ender's Game", genre: "Science Fiction"))
library.add_book(Book.new(title: "1776", genre: "History"))
library.add_book(Book.new(title: "The Hours", genre: "Fiction"))
library.add_book(Book.new(title: "Eating Animals", genre: "Non-Fiction"))

library.add_book(Book.new(title: "Northern Lights", genre: "Fantasy"))
library.add_book(Book.new(title: "Frankenstein", genre: "Science Fiction"))
library.add_book(Book.new(title: "The Rise and Fall of the Third Reich", genre: "History"))
library.add_book(Book.new(title: "The Kite Runner", genre: "Fiction"))
library.add_book(Book.new(title: "Iceland", genre: "Non-Fiction"))

library.add_person(Person.new('Daniel'))
library.add_person(Person.new('Peter'))
library.add_person(Person.new('Chris'))
library.add_person(Person.new('Beth'))
library.add_person(Person.new('Oscar'))
library.add_person(Person.new('Callum'))
library.add_person(Person.new('Leigh-Ann'))

library.lend('The Hobbit', 'Chris')
library.lend('Guns, Germs, and Steel', 'Chris')
library.lend('1776', 'Beth')
library.lend("Harry Potter and the Sorcerer's Stone", 'Daniel')
library.lend('Histories', 'Leigh-Ann')


def prompt(*args)
  print *args
  gets.chomp
end


def get_pin
  print "Create Pin: "
  pin1 = STDIN.noecho(&:gets).chomp
  puts "\n"
  print "Confirm Pin: "
  pin2 = STDIN.noecho(&:gets).chomp
  puts "\n"

  if pin1 == pin2
    puts "Pin accepted"
    return pin1
  else
    puts "Pin rejected. Please try again."
    puts "\n"
    get_pin()
  end
end

def header(string)
  string.upcase!
  puts "----#{string}------------"
  puts "\n"
end

#########################################################
puts "Welcome to the #{library.name}"
puts "\n"

# BECOME A MEMBER
header "Sign up"
user_name = prompt "Name: "
user_pin = get_pin()

person1 = Person.new(user_name, user_pin)
library.add_person(person1)
puts "\n"
puts "#{person1.name}, you are now a member of the #{library.name}"
puts "\n"

header "Our available books"
puts library.list_books


while true
  puts "\n"
  header "Menu"
  puts "Would you like to:\tcheckout book | return book |"
  puts "\t\t\texplore genres | view catalog |"
  puts "\t\t\tview members | view account | sign out"
  action = gets.chomp.downcase.strip
  puts "\n"

  case action
  when 'checkout book'
    header "Checkout book"
    library.checkout_book(person1)
  when 'return book'
    header "Return book"
    library.return_book(person1)
  when 'view members'
    header "Members"
    puts library.list_people
  when 'view catalog'
    header "Library catalog"
    header "Available books"
    puts "\n"
    header "Unavailable books"
    puts library.list_books_out
  when 'view account'
    header "#{person1.name}'s account"
    puts person1.format
  when 'explore genres'
    header "Explore genres"
    library.explore_genres
  when 'sign out', '0'
    puts "Thank you for visiting the #{library.name}"
    exit
  else
    puts "Command invalid. Please re-enter."
  end
end












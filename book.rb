class Book

  attr_accessor :due_date
  attr_reader :title, :genre

  @@count = 0

  def initialize(options = {})
    @title = options[:title]
    @genre = options[:genre]
    @due_date = nil
    increase_count
  end

  def format
    info = "title:\t#{title}\ngenre:\t#{genre}"
    info += "\ndue:\t#{due_date}" if due_date
    info
  end

  def self.count
    "There are #{@@count} books created"
  end


  private

  def increase_count
    @@count += 1
  end

  ### Alternate way to declare private methods 
  # private :increase_count

end
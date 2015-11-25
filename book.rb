class Book

  attr_reader :title, :genre, :due_date

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

  def set_due_date
    @due_date = Date.today + 14
  end

  def reset_due_date
    @due_date = nil
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
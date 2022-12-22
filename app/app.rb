require_relative './student'
require_relative './teacher'
require_relative './rental'
require_relative './book'

# rubocop:disable Metrics/ClassLength
class App
  attr_reader :book, :people, :rental

  def initialize
    @books = []
    @persons = []
    @rentals = []
  end

  def start
    puts menu_items

    input = gets.chomp
    if input <= '6'
      menu_options(input)
    elsif input == '7'
      puts 'Exiting.....!'
    else
      puts 'Please select an option from 1 - 7'
    end
  end

  def menu_options(input)
    case input
    when '1'
      list_all_books
    when '2'
      list_persons
    when '3'
      add_new_person
    when '4'
      add_new_book
    when '5'
      add_new_rental
    when '6'
      list_rentals
    else
      'Select an option from 1 to 7'
    end
  end

  def add_new_rental
    puts 'Select a book from the list (Enter number)'
    @books.each_with_index { |item, i| puts "#{i + 1}. #{item.title}, #{item.author}" }
    b_index = gets.chomp.to_i
    book = @books[b_index - 1]
    puts 'Select a person from the list (Enter number)'
    @persons.each_with_index { |item, i| puts "#{i + 1}. #{item.name}" }
    p_index = gets.chomp.to_i
    person = @persons[p_index - 1]
    print 'Date(yyyy/mm/dd): '
    date = gets.chomp
    rental = Rental.new(date, book, person)
    puts rental
    @rentals.push(rental)
    puts 'Rental created successfully'
    display_menu
  end

  def add_new_person
    print 'Select (1) to add a new student, (2) to add a new teacher:  '
    option = gets.chomp.to_i

    case option
    when 1
      add_new_student
    when 2
      add_new_teacher
    else
      puts 'Please select 1 or 2 !'
    end
  end

  def add_new_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    book = Book.new(title, author)
    @books.push(book)
    puts 'Book successfully created!'
    display_menu
  end

  def list_all_books
    if @books.empty?
      puts 'Sorry, no books found'
      display_menu
    end
    puts 'List of books:'
    puts ''
    @books.each_with_index do |elem, e|
      puts "#{e + 1}. Title: #{elem.title}, Author: #{elem.author}"
    end
    display_menu
  end

  def list_persons
    if @persons.empty?
      puts 'No body availble'
      display_menu
    end
    puts 'List of persons:'
    puts ''
    @persons.each_with_index do |elem, e|
      puts "#{e + 1}. [#{elem.class}] Name:#{elem.name},  Age: #{elem.age}"
    end
    display_menu
  end

  def menu_items
    puts ''
    puts 'Welcome!'
    puts ''
    puts 'Select an option from 1 - 7 (Enter number)'
    puts ''
    puts '1. List all books'
    puts '2. List all persons'
    puts '3. Create a person'
    puts '4. Create a book'
    puts '5. Create a rental'
    puts '6. List all rentals for a given person(ID)'
    puts '7. Exit'
  end

  def display_menu
    puts ''
    print 'Press Enter to display menu'
    gets.chomp
    puts ''
    start
  end

  def list_rentals
    puts 'Enter Person ID number'
    @persons.each { |item| puts "ID: #{item.id}, Person: #{item.name}" }
    print 'Person ID: '
    id = gets.chomp.to_i
    @rentals.each do |item|
      puts "Date: #{item.date}, Book: #{item.book.title} by #{item.book.author}" if item.person.id.to_i == id
    end
    display_menu
  end

  private

  def add_new_student
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Permission granted by parents? [Y/N]'
    permission = gets.chomp
    new_student = Student.new(age, permission, name)
    @persons.push(new_student)
    puts 'New student added successfully'
    display_menu
  end

  def add_new_teacher
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    teacher = Teacher.new(age, specialization, name)
    @persons.push(teacher)
    puts 'New teacher added successfullly'
    display_menu
  end
end
# rubocop:enable Metrics/ClassLength

## TODO: Implement CSV reading/writing
require 'csv'


class ContactData
 
  attr_reader :contacts

  def initialize(file)
    @file = file
    @contacts = []

    read
  end

  def read
    @contacts = []

    # Read all contacts from file

    # CSV.foreach('contacts.csv') do |csv|
    #   # puts "ID: #{csv[0]} Name: #{csv[1]} E-mail: #{csv[2]}" if option
    #   @contacts << Contact.new() # use field from CSV to create contact
    # end

    CSV.foreach(@file) do |row|
      @contacts << Contact.from_row(row)
    end
  end

  def write
    # Write All @contacts to the file
    # CSV.open(@file, "a") do |csv|  
    #   csv << @contacts
    # end

    open csv
      @contacts.each { |c| csv << c.to_row }
    end
  end

  def create(name, email, phone)
    @contacts << Contact.new(new_id, name, email, phone)
    write
  end

  private

  def new_id
    @contacts.max(:id) + 1
  end

  # def num_current_contact
  #   @contacts.length
  #   # total = 0
  #   # CSV.foreach('contacts.csv') do |csv|
  #   #   total += 1
  #   # end
  #   # total
  # end

end

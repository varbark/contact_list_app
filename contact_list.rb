require_relative 'contact'
require_relative 'contact_database'
require 'pry'
# TODO: Implement command line interaction
# This should be the only file where you use puts and gets

class ContactInteract

  def initialize
    @db = ContactData.new('contacts.csv')
  end


  def new_contact
    puts 'Please enter the full name: '
    name = gets.chomp
    puts 'Please enter the contact email: '
    mail = gets.chomp
    puts 'Please enter the contact phone type: '
    label = gets.chomp
    puts 'Please enter the contact phone number: '
    phone_number = gets.chomp
    contact_phone = "#{label}: #{phone_number}"
    # id_index = ContactData.num_current_contact + 1
    # binding.pry
    # contact = [id_index, name, mail, contact_phone]
    # @db.write(contact)

    @db.create(name, mail, phone)

  end


  def show_list
    puts 'Show all the contacts list: '
    ContactData.read
  end


end


ContactInteract.new.show_list


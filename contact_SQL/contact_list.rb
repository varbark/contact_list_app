require_relative 'contact'

require 'pry'
# TODO: Implement command line interaction
# This should be the only file where you use puts and gets

    

  def run_app
    while true do
      msg = 'Please give your command to the app: [N]ew, [L]ist, [S]how, [F]ind, [H]elp'
      user_input = prompt_user(msg)
      case user_input.downcase
      when 'n'
        new_contact
      when 'l'
          show_list
      when 's'
          show_contact_by_ID
      when 'f'
          find_by_name 
      when 'h'
          help
      when 'q'
          return
      end
    end

  end

  def prompt_user(message) 
    puts message
    gets.chomp
  end

  def new_contact
    
    firstname = prompt_user('Please enter your first name: ')
    lastname  = prompt_user('Please enter your last name: ')
    email     = prompt_user('Please enter the contact email: ')

    contact = Contact.new(firstname, lastname, email)
    contact.save
  end


  def show_list
    puts 'Show all the contacts list: '
    puts Contact.show_table
  end

  def show_contact_by_ID
    puts 'please provide ID number: '
    id = gets.chomp
    Contact.find(id)
  end

  def find_by_name 
    puts 'Please give a firstname to search: '
    name= gets.chomp
    Contact.find_all_by_firstname(name)
  end

  def help
    puts "Here is a list of available commands:
    new  - Create a new contact
    list - List all contacts
    show - Show a contact
    find - Find a contact"
  end


run_app


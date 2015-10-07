require_relative 'contact'
require_relative 'contact_database'
require 'pry'
# TODO: Implement command line interaction
# This should be the only file where you use puts and gets

    @db = ContactData.new('contacts.csv')

  def run_app
    
    get_command

    case @command[0].downcase
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
      else 
        run_app
    end 

  end

  def get_command
      puts 'Please give your command to the app: [N]ew, [L]ist, [S]how, [F]ind, [H]elp'
      ARGV.empty? ? @command = gets[0].downcase : @command = ARGV[0]
      @name = ARGV[1].downcase unless ARGV[1].nil? 
       ARGV.clear
  end

  def new_contact
    puts 'Please enter the full name: '
    name = gets.chomp
    puts 'Please enter the contact email: '
    email = gets.chomp
    puts 'Please enter the contact phone type: '
    phone_label = gets.chomp
    puts 'Please enter the contact phone number: '
    phone_number = gets.chomp
    contact_phone = "#{phone_label}: #{phone_number}"
    id = @db.new_id
    contact = Contact.new(id, name, email, contact_phone).to_row
    @db.write(contact)
  end


  def show_list
    puts 'Show all the contacts list: '
    puts @db.show
  end

  def show_contact_by_ID
    puts 'please provide ID number: '
    id = gets.chomp
    @db.find(:id, id)
  end

  def find_by_name 
    puts 'Please give a name to search: '
    name= gets.chomp
    puts @db.find(:name, name)
  end

  def help
    puts "Here is a list of available commands:
    new  - Create a new contact
    list - List all contacts
    show - Show a contact
    find - Find a contact"
  end


run_app


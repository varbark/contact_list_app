require_relative '../setup'

def run_app
  while true do
    user_input = prompt_user('Please give your command to the app: [N]ew, [L]ist, [S]how, [F]ind, [H]elp')
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

def put_result(message)
  puts message
end

def new_contact    
  firstname = prompt_user('Please enter your first name: ')
  lastname  = prompt_user('Please enter your last name: ')
  email     = prompt_user('Please enter the contact email: ')

  contact = Contact.create(firstname, lastname, email)
  put_result("ID: #{contact.id}, FirstName: #{contact.firstname} , 
              LastName: #{contact.lastname}, Email: #{contact.email} Save.")
end



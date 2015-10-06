class Contact
 
  attr_accessor :name, :email, :first_name

  def initialize(name, email)
    # TODO: assign local variables to instance variables
    # For ARGV
    @name = name
    @command = ARGV[0] unless ARGV.empty?
    @name = ARGV[1].downcase unless ARGV[1].nil?
    ARGV.clear
  end
 
  def to_s
    # TODO: return string representation of Contact

  end

  def to_row
    [@id, @name, @email, @phone]
  end

  def self.from_row(row)
    Contact.new(row[0], row[1], row[2], row[3])
  end
 
  ## Class Methods
  # class << self
  #   def create(name, email)
  #     # TODO: Will initialize a contact as well as add it to the list of contacts
  #       ContactInteract.new_contact
       
  #   end
 
  #   def find(term)
  #     # TODO: Will find and return contacts that contain the term in the first name, last name or email

  #   end
 
  #   def all
  #     # TODO: Return the list of contacts, as is
  #   end
    
  #   def show(id)
  #     # TODO: Show a contact, based on ID
  #   end
    
  # end
 
end
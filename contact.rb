class Contact
 
  attr_accessor :id, :name, :email, :phone

  def initialize(id, name, email, phone)
    # TODO: assign local variables to instance variables
    # For ARGV
    @id = id
    @name = name
    @email = email
    @phone = phone
  end
 
  def self.to_s(contact)
    # TODO: return string representation of Contact
    "ID: #{contact[:id]} Name: #{contact[:name]} E-mail: #{contact[:email]} Phone: #{contact[:phone]}"
  end

  def to_row
    [@id, @name, @email, @phone]
  end

  def self.creat_hash_from_row(row)
    db = Contact.new(row[0], row[1], row[2], row[3])
    contact = {id: db.id, name: db.name, email: db.email, phone: db.phone}
  end
 
end
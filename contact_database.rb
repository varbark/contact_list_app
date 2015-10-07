## TODO: Implement CSV reading/writing
require 'csv'
require 'pry'

class ContactData
 
  attr_reader :contacts

  def initialize(file)
    @file = file
    @contacts = []
    read
  end

  def read
    @contacts = []
    CSV.foreach(@file) do |row|
      @contacts << Contact.creat_hash_from_row(row)
    end
    @contacts
  end

  def show
    show = []
   @contacts.each do |contact|
    show << Contact.to_s(contact)
    end  
    show.join("\n")
  end

  def find(key, value)
    result = []
    @contacts.each{|contact| result << contact if contact[key] == value }
    result
  end

  def write(row)
    # Write All @contacts to the file
    CSV.open(@file, "a") do |csv|  
      csv << row
    end
  end

  def new_id
    max_id_contact = @contacts.max_by{|contact_hash| contact_hash[:id].to_i}
    max_id = (max_id_contact[:id].to_i)+1
    return max_id
  end


end

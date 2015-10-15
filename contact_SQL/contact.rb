require 'pg'
require 'pry'
require_relative 'contact_database'

class Contact 
  attr_reader :id, :firstname, :lastname, :email

  @@db = ContactDatabase.new('localhost', 'contact_list', 'development', 'development')
  # binding.pry
 

  def initialize(firstname, lastname, email)
    @firstname = firstname
    @lastname = lastname
    @email = email
    @id = nil
  end

  def save
    @id = @@db.insert_db(@firstname, @lastname, @email)
    "ID: #{@id}, FirstName: #{firstname}, LastName: #{lastname}, Email: #{email} Save."
  end

  def destroy
    @@db.delete_db(@id)
    "ID: #{@id}, FirstName: #{firstname}, LastName: #{lastname}, Email: #{email} Delete."
  end
   
  class << self

    def show_table
      @@db.show_table
    end

    def find(id)
      @@db.select_db_by_ID(id)
    end

    def find_all_by_lastname(name)
      @@db.select_all_by_lastname(name)
    end

    def find_all_by_firstname(name)
      @@db.select_all_by_firstname(name)
    end

    def find_by_email(email)
      @@db.select_by_email(email)
    end

  end

end


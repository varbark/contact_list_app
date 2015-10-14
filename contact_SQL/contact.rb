require 'pg'
require 'pry'

class Contact

  attr_reader :id, :name, :email

  class << self

    @@conn = nil

    def connection
      if @@conn.nil?
        @@conn = PG.connect(
          host: 'localhost',
          dbname: 'contact_list',
          user: 'development',
          password: 'development'
        )
      end
      @@conn
    end

    def show_table
      self.connection.exec('SELECT * FROM contacts;').each do |contact|
        puts contact
      end
    end

    def find(id)
      self.connection.exec_params('SELECT * FROM contacts WHERE
        id = $1;', [id]).each do |contact|
        puts contact
      end
    end

    def find_all_by_lastname(name)
      self.connection.exec_params('SELECT * FROM contacts WHERE
        lastname = $1;', [name]).each do |contact|
        puts contact
      end
    end

    def find_all_by_firstname(name)
      self.connection.exec_params('SELECT * FROM contacts WHERE
        firstname = $1;', [name]).each do |contact|
        puts contact
      end
    end

    def find_by_email(email)
      self.connection.exec_params('SELECT * FROM contacts WHERE
        firstname = $1;', [name]).each do |contact|
        puts contact
      end
    end

  end

  def initialize(firstname, lastname, email)
    @firstname = firstname
    @lastname = lastname
    @email = email
  end

  def save
    contact = self.class.connection.exec_params(
      "INSERT INTO contacts(firstname, lastname, email)
    VALUES($1, $2, $3) returning id;", [@firstname, @lastname, @email])
     @id = contact[0]["id"]
  end


  def destroy
    self.class.connection.exec_params("DELETE FROM contacts 
      WHERE id = $1;", [@id])
  end

end








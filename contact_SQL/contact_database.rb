class ContactDatabase

  # def self.get_connection
  #   @@connection || ContactDatabase.new('localhost', 'mydb', )
  # end

    def initialize(host, dbname, user, password)
      @host = host
      @dbname = dbname
      @user = user
      @password = password
      @conn = nil
      connect 
    end  

    def connect
      if @conn.nil?
        @conn = PG.connect(
          host: @host,
          dbname: @dbname,
          user: @user,
          password: @password
        )
      end
      @conn      
    end 

    def show_table
      connect.exec('SELECT * FROM contacts;').each do |contact|
        puts contact
      end
    end

    def insert_db(firstname, lastname, email)
     contact = connect.exec_params(
      "INSERT INTO contacts(firstname, lastname, email)
    VALUES($1, $2, $3) returning id;", [firstname, lastname, email])
     contact[0]["id"]
    end

    def delete_db(id)
      connection.exec_params("DELETE FROM contacts 
      WHERE id = $1;", [id])
    end

    def select_db_by_ID(value)
      result = connection.exec_params('SELECT * FROM contacts WHERE
      id = $1;', [value]).map do |contact|
      contact
      end
    end

    def select_all_by_lastname(name)
      result = connection.exec_params('SELECT * FROM contacts WHERE
        lastname = $1;', [name]).map do |contact|
          contact
      end
    end

    def select_all_by_firstname(name)
      result =  self.connection.exec_params('SELECT * FROM contacts WHERE
        firstname = $1;', [name]).map do |contact|
        contact
      end
    end

    def select_by_email(email)
      result = self.connection.exec_params('SELECT * FROM contacts WHERE
        email = $1;', [email]).map do |contact|
        contact
      end
    end
end
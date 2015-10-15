require 'pry'
require 'active_record'
require_relative 'lib/contact'


ActiveRecord::Base.logger = Logger.new(STDOUT)

puts 'Establishing connection to database ...'
ActiveRecord::Base.establish_connection(
  adapter: 'postgresql',
  database: 'contact_list',
  username: 'development',
  password: 'development',
  host: 'localhost',
  port: 5432,
  pool: 5,
  encoding: 'unicode',
  min_messages: 'error'
)


puts 'CONNECTED'

puts 'Setting up Database (recreating tables) ...'

ActiveRecord::Schema.define do
  drop_table :contacts if ActiveRecord::Base.connection.table_exists?(:contacts)
  create_table :contacts do |t|
    t.column :firstname, :string
    t.column :lastname, :string
    t.column :email, :string
  end
end

Contact.create(firstname: 'Toto', lastname: 'Lai', email: 'toto@gmail.com')
Contact.create(firstname: 'YC', lastname: 'Kuo', email: 'yc@gmail.com')
Contact.create(firstname: 'Kenrick', lastname: 'Lin', email: 'kenrick@gmail.com')

puts 'Setup DONE'

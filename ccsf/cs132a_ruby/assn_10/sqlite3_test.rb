#!/usr/local/bin/ruby
# Name: Kelly Hong
# File: sqlite3_test.rb
# Desc: Proof of concept for sqlite3 gem; requires installing the sqlite3 gem on Hills as
#       a regular user; creates salted, hashed passwords using digest and securerandom.

# specifiy a non-standard gem repository location via the GEM_HOME environment
ENV['GEM_HOME']='/students/khong5/mygems'

# import required libraries
require 'rubygems'
require 'sqlite3'
require 'digest'
require 'securerandom'

# Create the SQLite3 database and db object
dbfile = "lab7.db"
db = SQLite3::Database::new(dbfile)

# Define the SQL for creating the users table
create_users_table_sql =  <<SQL
CREATE TABLE users (
  id integer primary key,
  name varchar(15) not null,
  email varchar(18) not null unique,
  hashed_password varchar(64) not null,
  password_salt varchar(32) not null)
SQL

begin
  # Check to see if the table exists
  db.execute("DROP TABLE users")
rescue Exception => e
  # If the table is missing we'll end up here. This should happen
  # the first time you run the script.
  puts e.message
  puts "Recreating the USERS table"
end

# Create users table
db.execute(create_users_table_sql)

users = [
    %w(joe joe@joe.com topsecret1),
    %w(jose jose@jo.com topsecret1),
    %w(tom tom@tom.com topsecret2),
    %w(jonelle jonelle@joe.com topsecret1),
    %w(tara tara@tom.com topsecret2),
    %w(jake jake@joe.com topsecret1),
    %w(tammy tammy@tom.com topsecret2),
    %w(jacob jacob@joe.com topsecret1),
    %w(winnie winnie@joe.com topsecret1),
    %w(david david@tom.com topsecret2),
    %w(dick dick@dick.com topsecret3)
]

# SQLite has transaction and rollback. We'll uses these features in this script.

# Begin the transaction:
db.execute('BEGIN')

# Try to create the users records.
users.each do |user|

  # The password salt is added to the password to increase complexity
  # We'll create a different salt for every user
  password_salt = SecureRandom.base64 # it will look something like this: 'asldkfjasd98f798u23kr798d7f'

# Create hashed password and assign it to users hashed_password field.
  user[2] = Digest::SHA2.hexdigest(user[2] + password_salt)
  begin
    # Try to insert the record into the database.
    db.execute("INSERT INTO users (id,name,email,hashed_password, password_salt) values (null,?,?,?,?)", user << password_salt)
  rescue SQLite3::ConstraintException => e
    # If the INSERT doesn't work for some reason, we end up here.
    puts
    puts "#" * 60
    puts "ERROR: " +  user[1] + " is already in the database."
    # On any failure, rollback and exit. First, you have to clean up the data before you can procede.
    puts "Rolling back to the initial state of the database."
    puts "#" * 60
    db.execute('ROLLBACK')
    exit
  end
end

# If we get to here we can commit the data.
db.execute('COMMIT')

# display only desired data in table
all = db.execute("SELECT name, email, hashed_password, password_salt FROM users;")

# get table headers
#headers = db.execute("SELECT sql FROM sqlite_master WHERE type = 'table' AND tbl_name = 'users';")

headers = %w(NAME EMAIL HASHED_PASSWORD PASSWORD_SALT)

headers.each {|item| printf("%-70s", item)}
# This is a simple dump, but you must display the output formatted in columns.
all.each do |row|
  row.each {|item| printf("%-70s", item)}
  puts
end

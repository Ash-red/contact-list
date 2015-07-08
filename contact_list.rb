require_relative 'contact'
require_relative 'contact_database'

# TODO: Implement command line interaction
# This should be the only file where you use puts and gets

id = ARGV[1]
term = ARGV[1]

if ARGV[0] == 'help'
  puts "Here is a list of available commands:"
  puts '  new - Create a new contact'
  puts '  list- List all contacts'
  puts '  show- Show a contact'
  puts '  find- Find a contact'

elsif ARGV[0] == 'new'
  puts 'Email: '
  email = STDIN.gets.chomp.downcase.to_s
  puts 'First name: '
  name = STDIN.gets.chomp.downcase.to_s
  puts 'Phone type: '
  phone_type = STDIN.gets.chomp.downcase
  puts 'Phone number: '
  phone_num = STDIN.gets.chomp.downcase
    if Contact.test_duplicate(email) 
      puts 'Alert: Contact already existssssssss!'
    else
      Contact.create(email, name, phone_type, phone_num)
    end
elsif ARGV[0] == 'list'
  Contact.all
elsif ARGV[0] == 'show' 
  Contact.show(id)  
elsif ARGV[0] == 'find'
  Contact.find(term)   
elsif ARGV[0] == 'add'
  puts 'Phone_type:'
  phone_type2 = STDIN.gets.chomp.downcase
  puts 'Phone number: '
  phone_num2 = STDIN.gets.chomp.downcase

  Contact.add_phone(phone_type2, phone_num2, term)
else
  puts 'Sorry, unrecognized command.'
end
class Contact

 
  attr_accessor :name, :email, :id

  def initialize(name, email, id)
    # TODO: assign local variables to instance variables
    @name = name
    @email = email
    @id = id
  end
 
  def to_s
    # TODO: return string representation of Contact

  end
 
  ## Class Methods
  class << self
    def create(email, name, phone_type, phone_num)
      # TODO: Will initialize a contact as well as add it to the list of contacts
      phone_fusion = [phone_type, phone_num].join(': ')
      contact_array = [email, name] << phone_fusion
 
      count = 0

      CSV.open('contacts.csv', 'a') do |csv_object|
          csv_object << contact_array   
      end
      CSV.foreach('contacts.csv') do |row|
        count += 1
      end
      puts count

    end
 
    def find(term)
      # TODO: Will find and return contacts that contain the term in the first name, last name or email
      i = 0
      CSV.foreach('contacts.csv') do |email, name| 
        i += 1
        id = "#{i}: #{name} (#{email})"
        if id.include?(term) 
          puts "#{name} #{email}"
        end
      end
    end
 
    def all
      # TODO: Return the list of contacts, as is
      i = 0
      CSV.foreach('contacts.csv') do |email, name| 
        i += 1
        puts "#{i}: #{name} (#{email})"
      end
    end
    
    def show(id)
      # TODO: Show a contact, based on ID
      i = 0
      CSV.foreach('contacts.csv') do |email, name| 
        i += 1
        id_copy = "#{i}: #{name} (#{email})"
        if id == "#{i}"
          puts "#{name}\n#{email}"
        end
      end
    end

    def test_duplicate(email)
      file = []
      CSV.foreach('contacts.csv') do |e, n|
        file << e
      end
      if file.include?(email)
          true
        else
          false
        end
    end

    def add_phone(phone_type2, phone_num2, term)
     
      phone_fusion2 = [phone_type2, phone_num2].join(': ')
       
       CSV.open('contacts.csv', 'a') do |row|
         CSV.foreach('contacts.csv') do |email, name| 
          if email == term  
            row << phone_fusion2  
          end
         end
       end
    end
  end
 
end
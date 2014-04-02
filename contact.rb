class Contact
  @@counter=0
  attr_accessor :first_name, :last_name, :email, :note, :id
  def initialize(first_name,last_name,email,note)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @note = note
    @@counter += 1
    @id = @@counter
  end
end

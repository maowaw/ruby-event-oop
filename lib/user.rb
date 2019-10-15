#require 'pry'

class User

  attr_accessor :email, :age #read & write variable
  @@all_users = []

  def initialize(email_to_save, age_to_save) #on définit un initialize

      @email = email_to_save #on sauve email dans l'instance
      @age = age_to_save #idem pour l'age
      @@all_users << self #réinjecte tout l'user avec ses infos dans l'array
  
			#OU @@all_users << User.name (il y a de l'idée..)	
			

  end


  def self.all
    return @@all_users
  end

  #retrouver un user
  def self.find_by_email(email_to_find)

    return @@all_users.find{|user| user.email == email_to_find} #on veut retrouver un item qui est dans la colonne email : donc dans l'accolade on met variable.email
    #return @@all_users.map{|user| user.email == email_to_find} #cette ligne renvoie vrai pour celui qui correspond

  end 
  



end

#binding.pry
#puts "end of file"


#require 'pry'
require 'time'

class Event

  attr_accessor :start_date #read & write variable
  @@all_events = []

def initialize(start_date, duration_to_save, title_to_save, attendees_to_save) #on définit un initialize

	#stocker la start date en fonction de si c'est un string ou non
		if start_date.class == String
			@start_date = Time.parse("#{start_date}")

		else
      @start_date = start_date 
    end

  #stocker la durée
    @duration = duration_to_save.to_i

  #stocker le titre de l'évenement
  	@title = title_to_save

	#stocker un array d'email des personnes allant à l'event
		@attendees = attendees_to_save

	#créer un tableau avec toutes les infos
    @@all_events << self #réinjecte 

end


# Méthode permettant de décaler l'évenement de 24h. ATTENTION, nécessite de nommer l'instance :
# On ne pourra pas faire Event.postpone_24h, mais event_01.postpone_24h
def postpone_24h
	@start_date = @start_date + (24*60*60)

end

#Calcule et renvoie la date de fin de l'event
def end_date
	puts @end_date = @start_date + @duration
	return @end_date
end


#return true if the event started already
def is_past?
	end_date < Time.now
end


#return true if the event is in the future
def is_future?
	@start_date > Time.now
end

#return true if the event is in less than 30 minutes
def is_soon?
	Time.now < @start_date && Time.now > @start_date - (30*60) 
end

def self.all
  return @@all_events
end

def to_s
	puts ">Titre : #{@title}"
	puts ">Date de début : #{@start_date.ctime}"
	puts ">Durée : #{@duration} minutes"
	puts ">Invités : #{@attendees * ", "}"
end


#COURS POO 2 (151019)


def age_analysis
    age_array = [] #On initialise un array qui va contenir les âges de tous les participants à un évènement
    average = 0 #On initialise une variable pour calculer la moyenne d'âge à l'évènement

    @attendees.each do |attendee| #On parcourt tous les participants (objets de type User)
      age_array << attendee.age #leur âge est stocké dans l'array des âges
      average = average + attendee.age #leur âge est additionné pour préparer le calcul de la moyenne
    end

    average = average / @attendees.length #on divise la somme des âges pour avoir la moyenne

    puts "Voici les âges des participants :"
    puts age_array.join(", ")
    puts "La moyenne d'âge est de #{average} ans"
  end

end



#Pour indiquer que la class WorkEvent hérite de la classe Event, je dois utiliser la syntaxe class WorkEvent < Event. Ce qui donnera :
class WorkEvent < Event

	#Si on veut rajouter lattribut @location aux WorkEvent, voici ce que je dois coder :
attr_accessor :location

 def initialize(start_date, duration, title, attendees, location)
    @location = location # j'ai rajouté cette ligne
    super(start_date, duration, title, attendees) #fait appel au initialize de la classe Event
  end




	def is_event_acceptable?
    if @attendees.length > 3 || @duration > 60
      puts "Cette réunion ne respecte pas nos bonnes pratiques !"
      return false
    else
      puts "Cette réunion est OK."
      return true
    end
  end

end












#binding.pry
#puts "end of file"


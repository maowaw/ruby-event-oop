require 'pry'
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


end

binding.pry
puts "end of file"


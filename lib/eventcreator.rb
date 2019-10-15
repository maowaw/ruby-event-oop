
require 'time'
require 'pry'

class Event

  attr_accessor :start_date #read & write variable
  @@all_events = []

def initialize #on définit un initialize : pour le faire commencer on fait mon_evnmt.new

	puts "Salut, tu veux créer un événement ? Cool ! \n Commençons. Quel est le nom de l'événement ?"
  @title = gets.chomp
  puts "> #{@title}"

	puts "Super. Quand aura-t-il lieu ?"
	@start_date = gets.chomp 

		if @start_date.class == String
			@start_date = Time.parse("#{@start_date}")

		else
      @start_date = @start_date 
    end

	puts "> #{@start_date}"


	puts "Au top. Combien de temps va-t-il durer (en minutes) ?"
  @duration = gets.chomp
  puts "> #{@duration.to_i}"

  puts "Génial. Qui va participer ? Balance leurs e-mails"

	@attendees = []
	while true
	  attendee = gets.chomp
	  break if attendee.empty?
	  @attendees << attendee
	end
	puts "> #{@attendees}"

	puts "Super, c'est noté, ton évènement a été créé !"

	#créer un tableau avec toutes les infos
    @@all_events << self #réinjecte 

 

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





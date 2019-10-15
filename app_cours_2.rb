require 'bundler'
Bundler.require

require_relative 'lib/user'
require_relative 'lib/event'


#Lancer sur le pry :

#julie = User.new("julie@email.com", 35) #je crée un premier User
#jean = User.new("jean@maimail.com", 22) #puis un second User
#meeting = WorkEvent.new("2019-01-17 09:00", 70, "réunion de travail", [julie, jean]) # je crée un WorkEvent

#meeting.is_past? #on obtient bien true
#meeting.to_s #on obtient l'affichage de l'objet avec les identifiants bruts des User

#meeting.postpone_24h
#meeting.start_date #on confirme qu'elle a été déplacée au 2019-01-18, 9h


binding.pry
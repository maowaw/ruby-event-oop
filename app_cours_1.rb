# lignes très pratiques qui appellent les gems du Gemfile. On verra plus tard comment s'en servir ;) - ça évite juste les "require" partout
require 'bundler'
Bundler.require

# lignes qui appellent les fichiers lib/user.rb et lib/event.rb
# comme ça, tu peux faire User.new dans ce fichier d'application. Top.
require_relative 'lib/user'
require_relative 'lib/event'


# Maintenant c'est open bar pour tester ton application. Tous les fichiers importants sont chargés
# Tu peux faire User.new, Event.new, binding.pry, User.all, etc.

#puts Event.new("2010-10-31 12:00", 35, "meeting", ["moi", "moi"])
#puts Event.all

#puts User.new("mahaut@de.com", 25)
#puts User.all


#COURS 2

#pour avoir les noms stockés, et que julien et jean soient un array d'objets et non plus de strings
julie = User.new("julie@email.com", 35) #je crée un premier User
jean = User.new("jean@maimail.com", 22) #puis un second User

#on a donc toutes les infos sur julie et jean dans l'attribut @attendees
my_event = Event.new("2019-01-13 09:00", 10, "standup quotidien", [julie, jean]) #et je les insère tous les deux dans un nouvel Event


my_event.age_analysis #j'exécute la nouvelle méthode que j'ai écrite
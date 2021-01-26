require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new("Josiane")
player2 = Player.new("José")

while player1.life_points > 0 && player2.life_points > 0 do

    puts 
    puts "Voici l'etat de chaque joueur :"
    player1.show_state
    player2.show_state

    puts 
    puts "Passons a la phase d'attaque :"


    player1.attacks(player2) # le joueur 1 attaque en premier
    if player2.life_points <= 0 # si le joueur 2 meurt, il ne peut plus faire une dernière attaque sur le joueur 1
        break
    end
    player2.attacks(player1)
end 


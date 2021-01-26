require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "
------------------------------------------------
|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |
|Le but du jeu est d'être le dernier survivant !|
|Qui sera le dernier survivant ?                |
-------------------------------------------------
"
puts "Quel et ton prenom ?"
user_name = gets.chomp.to_s
player_man = HumanPlayer.new(user_name)

enemie1 = Player.new("Josiane")
enemie2 = Player.new("José")
enemies = [enemie1, enemie2]

while player_man.life_points > 0 && (enemie1.life_points > 0 || enemie2.life_points > 0)
    
    puts "******************************************************"
    puts "Quelle action veux-tu effectuer ? "
    puts
    puts "a - chercher une meilleure arme"
    puts "s - chercher à se soigner "
    puts
    puts "Attaquer un joueur en vue :"
    if enemie1.life_points > 0
       print "0 - "
       enemie1.show_state
    end
    if enemie2.life_points > 0
       print "1 - "
       enemie2.show_state
    end
      
    puts
    puts "Votre choix ?"
    action = gets.chomp
    puts "--------------------"

    if action == "a"
        puts 
        player_man.search_weapon
    end
    if action == "s"
        puts
        player_man.search_health_pack
    end
    if action == "0" && enemie1.life_points > 0
        puts
        player_man.attacks(enemie1)
    end
    if action == "1" && enemie2.life_points > 0
        puts
        player_man.attacks(enemie2)
    end

    puts 

    if enemie2.life_points > 0 && enemie1.life_points > 0
        puts
        puts "Les autres joueurs t'attaquent !"
    end
    enemies.each do | enemie |
        if enemie.life_points>0
        enemie.attacks(player_man)
        end
    end
end

puts "------------------------------------------------------"
puts "La partie est finie"
if player_man.life_points > 0
  puts "BRAVO ! TU AS GAGNE !"
else 
  puts "Desole ! Tu as perdu !"
end
puts

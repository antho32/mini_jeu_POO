class Player
	
	attr_accessor :name, :life_points
	
	def initialize (name)
		@name = name
		@life_points = 10
	end
	
	def show_state
        puts "#{@name} a #{@life_points} points de vie"
    end

    def gets_damage(number)
        @life_points -= number
        if @life_points <= 0 
            puts "Le joueur #{name} a été tué !"
        end
    end

    def attacks(player2)
        puts "#{name} attaque #{player2.name}"
        number = compute_damage
        puts "Il lui inflige #{number} points de dommages"
        player2.gets_damage(number)
    end

    def compute_damage
        return rand(1..6)
    end
end 

class HumanPlayer < Player

    attr_accessor :weapon_level

    def initialize(name)
        super(name) 
        @life_points = 100
        @weapon_level = 1
    end

    def show_state
       puts "#{name} a #{life_points} points de vie et une arme de niveau #{weapon_level}" 
    end

    def compute_damage
        rand(1..6) * @weapon_level
    end

    def search_weapon
        new_weapon = rand(1..6)
        puts "Tu a trouver une arme de niveau #{new_weapon}"
        if new_weapon > @weapon_level
            @weapon_level = new_weapon
            puts "Youhou ! elle est meilleur que ton arme actuelle : tu la prends"
        else
            puts "M@*#$.. elle n'est pas mieux que ton arme actuelle.."
        end
    end 

    def search_health_pack
        healt_pack = rand(1..6)
        if healt_pack == 1 
            puts "Tu n'a rien trouvé..."
        elsif healt_pack == 2 && 5 
            if @life_points >=50
               @life_points = 100
            else @life_points = @life_points +50
            end 
            puts "Bravo tu as trouver un pack de +50 de point de vie !"
        elsif healt_pack == 6 
            if @life_points >=20
               @life_points = 100
            else @life_points = @life_points +80
            end
            puts "Waow, tu as trouvé un pack de +80 points de vie !"
        end 
    end
         

end 
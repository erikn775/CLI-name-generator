class Player

    @@all = []

    @@list_of_names =
            {
            "LawfulGood" => ["Goliath", "Firbolg"],
            "LawfulNeutral" => ["Human","Half-orc"],
            "LawfulEvil" => ["Halfling", "Beholder"],
            "NeutralGood" => ["Dwarf","Gnome"],
            "NeutralNeutral" => ["Orc","Human"],
            "NeutralEvil" => ["Drow","Aasimar"],
            "ChaoticGood" => ["Elf","Dragonborn"],
            "ChaoticNeutral" => ["Aarakocra","Goliath"],
            "ChaoticEvil" => ["Tiefling", "Triton"]
            }

    def initialize
        @@all << self
    end

    def display
        "#{@name} plays a #{@gender} #{@species} named #{@final_name}"
    end

    def get_name
        puts "What is your name?"
        @name = gets.chomp
    end

    def get_gender
        puts "What is your gender?"
        @gender = gets.chomp
        api_gender = @gender
        if api_gender != "Male" && api_gender != "Female" 
            api_gender= "Male"
        end
        return api_gender.capitalize
    end

    def valid_entry?(user_input)
        user_input.between?(1,3)
    end
    
    def description(new_hash)
        puts "How would you describe yourself: "
        new_hash.each do |key, value|
                puts "#{key}. #{value}" 
        end  
            user_input = gets.chomp.to_i
            while !valid_entry?(user_input)
                Image.error_message
                user_input = gets.chomp.to_i
            end
        return new_hash[user_input]
    end
    
    def lawful_chaotic
        new_hash = {1 => "Lawful", 2 => "Neutral", 3 => "Chaotic"}
        description(new_hash)
    end
    
    def good_evil
        new_hash= {1 => "Good", 2 => "Neutral", 3 => "Evil"}
        description(new_hash)
    end
    
    def species_suggestions
        the_chosen_one = [lawful_chaotic, good_evil].join
        return @@list_of_names[the_chosen_one]
    
    end
    
    def species_selector
        species_list = species_suggestions
        puts "Choose your Species: 1. #{species_list[0]} 2. #{species_list[1]}"
        @species = species_list[gets.chomp.to_i - 1]
        return @species
    end

    def name_conversion
        user_input = get_name.length
        name_count = user_input % 10
        return name_count - 1
    end

    def name_decision_maker(name_from_api)
        @final_name = name_from_api[name_conversion]
        puts "Based on all your selections we have determined your name will be #{@final_name}!"
        puts "Congrats and enjoy you journey #{@final_name}!"
    end
    
    def self.display_players
        puts "Would you like to see all players?"
        user_answer = gets.chomp
        if user_answer == "yes" || user_answer == "Yes"
            @@all.each {|player| puts player.display}
        end
    end
end


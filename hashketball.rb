require "pry"

def game_hash
    game_hash = {
        :home => {
            :team_name => "Brooklyn Nets",
            :colors => ["Black", "White"],
            :players => {
                "Alan Anderson" => {
                    :number => 0,
                    :shoe => 16,
                    :points => 22,
                    :rebounds => 12,
                    :assists => 12,
                    :steals => 3,
                    :blocks => 1,
                    :slam_dunks => 1
                },
                "Reggie Evans" => {
                    :number => 30,
                    :shoe => 14,
                    :points => 12,
                    :rebounds => 12,
                    :assists => 12,
                    :steals => 12,
                    :blocks => 12,
                    :slam_dunks => 7
                },
                "Brook Lopez" => {
                    :number => 11,
                    :shoe => 17,
                    :points => 17,
                    :rebounds => 19,
                    :assists => 10,
                    :steals => 3,
                    :blocks => 1,
                    :slam_dunks => 15
                },
                "Mason Plumlee" => {
                    :number => 1,
                    :shoe => 19,
                    :points => 26,
                    :rebounds => 12,
                    :assists => 6,
                    :steals => 3,
                    :blocks => 8,
                    :slam_dunks => 5
                },
                "Jason Terry" => {
                    :number => 31,
                    :shoe => 15,
                    :points => 19,
                    :rebounds => 2,
                    :assists => 2,
                    :steals => 4,
                    :blocks => 11,
                    :slam_dunks => 1
                }
            }
        },
        :away => {
            :team_name => "Charlotte Hornets",
            :colors => ["Turquoise", "Purple"],
            :players => {
                "Jeff Adrien" => {
                    :number => 4,
                    :shoe => 18,
                    :points => 10,
                    :rebounds => 1,
                    :assists => 1,
                    :steals => 2,
                    :blocks => 7,
                    :slam_dunks => 2
                },
                "Bismack Biyombo" => {
                    :number => 0,
                    :shoe => 16,
                    :points => 12,
                    :rebounds => 4,
                    :assists => 7,
                    :steals => 7,
                    :blocks => 15,
                    :slam_dunks => 10
                },
                "DeSagna Diop" => {
                    :number => 2,
                    :shoe => 14,
                    :points => 24,
                    :rebounds => 12,
                    :assists => 12,
                    :steals => 4,
                    :blocks => 5,
                    :slam_dunks => 5
                },
                "Ben Gordon" => {
                    :number => 8,
                    :shoe => 15,
                    :points => 33,
                    :rebounds => 3,
                    :assists => 2,
                    :steals => 1,
                    :blocks => 1,
                    :slam_dunks => 0
                },
                "Brendan Haywood" => {
                    :number => 33,
                    :shoe => 15,
                    :points => 6,
                    :rebounds => 12,
                    :assists => 12,
                    :steals => 22,
                    :blocks => 5,
                    :slam_dunks => 12
                }
            }
        }
    }
end


def num_points_scored(players_name)
    points = 0
    game_hash.each do |team, outer|
        outer.each do |teamstats, details|
            if teamstats == :players
                details.each do |names, stats|
                    if names == players_name
                        stats.each do |stat, value|
                            if stat == :points
                                points = value
                            end
                        end
                    end
                end
            end
        end
    end
    points 
end

def shoe_size(players_name)
    size = 0
    game_hash.each do |team, outer|
        outer.each do |teamstats, details|
            if teamstats == :players
                details.each do |names, stats|
                    if names == players_name
                        stats.each do |stat, value|
                            if stat == :shoe
                                size = value
                            end
                        end
                    end
                end
            end
        end
    end
    size  
end

def team_colors(team_name)
    colors = []
    if game_hash[:home][:team_name] == team_name
        colors = game_hash[:home][:colors]
    elsif game_hash[:away][:team_name] == team_name
        colors = game_hash[:away][:colors]
    else 
        puts "Yo, double check that team name."
    end
    colors
end

def team_names
    teams = []
    teams << game_hash[:home][:team_name]
    teams << game_hash[:away][:team_name]
    teams
end

def player_numbers(team_name)
    jersies = []
    if game_hash[:home][:team_name] == team_name
        game_hash[:home].each do |teamstats, details|
            if teamstats == :players
                details.each do |names, stats|
                    stats.each do |key, value|
                        if key == :number
                            jersies << value
                        end
                    end
                end
            end
        end
    elsif game_hash[:away][:team_name] == team_name
        game_hash[:away].each do |teamstats, details|
            if teamstats == :players
                details.each do |names, stats|
                    stats.each do |key, value|
                        if key == :number
                            jersies << value
                        end
                    end
                end
            end
        end
    else 
        puts "Yo, double check that team name."
    end
    jersies
end

def player_stats(players_name)
    pstats = {}
    if game_hash[:home][:players].keys.include?(players_name)
        pstats = game_hash[:home][:players][players_name]
    elsif game_hash[:away][:players].keys.include?(players_name)
        pstats = game_hash[:away][:players][players_name]
    else
        puts "Yo, double check that player name."
    end
    pstats
end

def big_shoe_rebounds
    storagearray = []
    finalarray = []
    game_hash.each do |team, outer|
      outer.each do |teamstats, details|
        if teamstats == :players
          details.each do |names, stats|
            storagearray << names
              stats.each do |stat, value|
                if stat == :shoe
                  storagearray << value
                end
                if stat == :rebounds
                  storagearray << value
                end
              end
            end
          end
        end
      end
    storagearray
    finalarray = storagearray.each_slice(3).to_a
    finalarray.sort
    finalarray.flatten
    finalarray[-1][-1]
  end
require 'pry'

def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {player_name: "Alan Anderson",
        number: 0,
        shoe: 16,
        points: 22,
        rebounds: 12,
        assists: 12,
        steals: 3,
        blocks: 1,
        slam_dunks: 1},
        
        {player_name: "Reggie Evans",
        number: 30,
        shoe: 14,
        points: 12,
        rebounds: 12,
        assists: 12,
        steals: 12,
        blocks: 12,
        slam_dunks: 7},
        
        {player_name: "Brook Lopez",
        number: 11,
        shoe: 17,
        points: 17,
        rebounds: 19,
        assists: 10,
        steals: 3,
        blocks: 1,
        slam_dunks: 15},
        
        {player_name: "Mason Plumlee",
        number: 1,
        shoe: 19,
        points: 26,
        rebounds: 11,
        assists: 6,
        steals: 3,
        blocks: 8,
        slam_dunks: 5},
        
        {player_name: "Jason Terry",
        number: 31,
        shoe: 15,
        points: 19,
        rebounds: 2,
        assists: 2,
        steals: 4,
        blocks: 11,
        slam_dunks: 1}
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {player_name: "Jeff Adrien",
        number: 4,
        shoe: 18,
        points: 10,
        rebounds: 1,
        assists: 1,
        steals: 2,
        blocks: 7,
        slam_dunks: 2},
        
        {player_name: "Bismack Biyombo",
        number: 0,
        shoe: 16,
        points: 12,
        rebounds: 4,
        assists: 7,
        steals: 22,
        blocks: 15,
        slam_dunks: 10},
        
        {player_name: "DeSagna Diop",
        number: 2,
        shoe: 14,
        points: 24,
        rebounds: 12,
        assists: 12,
        steals: 4,
        blocks: 5,
        slam_dunks: 5},
        
        {player_name: "Ben Gordon",
        number: 8,
        shoe: 15,
        points: 33,
        rebounds: 3,
        assists: 2,
        steals: 1,
        blocks: 1,
        slam_dunks: 0},
        
        {player_name: "Kemba Walker",
        number: 33,
        shoe: 15,
        points: 6,
        rebounds: 12,
        assists: 12,
        steals: 7,
        blocks: 5,
        slam_dunks: 12}
      ]
    }
  }
end

def find_player_stats(player_name)
  home = game_hash[:home][:players]
  away = game_hash[:away][:players]
  home_index = 0
  away_index = 0
  while home_index < home.length do
    if home[home_index][:player_name] == player_name
      return home[home_index]
    else 
      home_index += 1
    end
  end
  
  while away_index < away.length do
    if away[away_index][:player_name] == player_name
      return away[away_index]
    else
      away_index +=1
      end
    end
  end

def player_stats(player_name)
  player = find_player_stats(player_name)
  player.delete(:player_name)
  player
end

def num_points_scored(player_name)
  player = find_player_stats(player_name)
  player[:points]
end

def shoe_size(player_name)
  player = find_player_stats(player_name)
  player[:shoe]
end

def team_colors(team_name)
  game_hash.each do |home_or_away, value|
    if value[:team_name] == team_name
      return value[:colors]
    end
  end
end

def team_names
  list_of_names = []
  game_hash.each do |home_or_away, value|
    name = value[:team_name]
    list_of_names << name
  end
  list_of_names
end

def players(team_name)
  game_hash.each do |home_or_away, value|
    if value[:team_name] == team_name
      return value[:players]
        end
    end
end

def player_numbers(team_name)
  numbers_array = []
  team_array = players(team_name)
  team_array.each do |player|
    numbers_array << player[:number]
  end
  numbers_array
end

def big_shoes
  hash_of_shoe_sizes = {}
  home_team_name = game_hash[:home][:team_name]
  away_team_name = game_hash[:away][:team_name]
  home_players = players(home_team_name)
  away_players = players(away_team_name)

  home_players.each do |stat|
    name = stat[:player_name]
    hash_of_shoe_sizes[name] = stat[:shoe]
  end

  away_players.each do |stat|
    name = stat[:player_name]
    hash_of_shoe_sizes[name] = stat[:shoe]
  end
  hash_of_shoe_sizes
end

def rebounds(player_name)
  player = find_player_stats(player_name)
  player[:rebounds]
end

def big_shoe_rebounds
  biggest_shoes = big_shoes.max_by do |name, shoe_size| shoe_size
end
  player_name = biggest_shoes[0]
  rebounds(player_name)
end
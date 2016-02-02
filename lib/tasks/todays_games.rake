    def createPlayers(teamID)
      player_info = HTTParty.get(
      'http://stats.nba.com/stats/teamplayerdashboard/',
      { query: { DateFrom: nil, DateTo: nil, GameSegment: nil, LastNGames: '0', LeagueID: '00', Location: nil, MeasureType: 'Base', Month: '0', OpponentTeamID: '0', Outcome: nil, PaceAdjust: 'N', PerMode: 'PerGame', PerGame: nil, Period: '0', PlusMinus: 'N', Rank: 'N', Season: '2015-16', SeasonSegment: nil, SeasonType: 'Regular Season', TeamID: teamID, VsConference: nil, VsDivision: nil }, headers: { "User-Agent" => 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.111 Safari/537.36' }})

      player_info['resultSets'].each do | result |
        puts result['name']
          player_stats = {}
        if result['name'] == 'PlayersSeasonTotals'
          result['rowSet'].each do | row |
            player_stats[:name] = row[2]#playername
            player_stats[:fg_percent] = row[10]#fg_pct
            player_stats[:fg3_percent] = row[13]#fg3_pct
            player_stats[:ft_percent] = row[16]#ft_pct
            player_stats[:reb] = row[19]#reb
            player_stats[:assist] = row[20]#ast
            player_stats[:tov] = row[21]#tov
            player_stats[:stl] = row[22]#stl
            player_stats[:blk] = row[23]#blk
            player_stats[:pts] = row[27]#pts
          end
          Player.create(player_stats)
        end
      end
    end

desc "tonights game info"
task :todays_games_info => :environment do 
    currentDate = DateTime.now.strftime("%Y%m%d")
    url = "http://data.nba.com/data/5s/json/cms/noseason/scoreboard/#{currentDate}/games.json"
    res = HTTParty.get(url)
     
    games = [];
    res["sports_content"]['games']['game'].each do | result |
      game = {}  
      
      game[:date] = result['date']#date of game
      game[:home_points] = result['home']['score']
      game[:visiting_points] = result['visitor']['score']
      game[:time_of_game] = result['period_time']['period_status']#timeofgame
      game[:visit_teamID] = result['visitor']['id']
      game[:home_teamID] = result['home']['id']
      game[:nba_id] = result['id']
      games.push(game)
    end

    games.each do |game| 
      Game.create(game)
      
      
      visitor_team = {}
      home_team = {}
      
      visit_info = HTTParty.get(
      'http://stats.nba.com/stats/teaminfocommon/',
      { query: { LeagueID: '00', SeasonType: 'Regular Season', TeamID: game[:visit_teamID], season: '2015-16' }, headers: { "User-Agent" => 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.111 Safari/537.36' }})

      home_info = HTTParty.get(
      'http://stats.nba.com/stats/teaminfocommon/',
      { query: { LeagueID: '00', SeasonType: 'Regular Season', TeamID: game[:home_teamID], season: '2015-16' }, headers: { "User-Agent" => 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.111 Safari/537.36' }})

      visit_info['resultSets'].each do | result |
        puts result['name']
        if result['name'] == 'TeamInfoCommon'
          result['rowSet'].each do | row |
            visitor_team[:city] = row[2]
            visitor_team[:name] = row[3]#teamname
            visitor_team[:conference] = row[5]#Conference
            visitor_team[:rank] = row[11]
            visitor_team[:wins] = row[8]#wins
            visitor_team[:losses] = row[9]#losses
          end
        end
        if result['name'] == 'TeamSeasonRanks'
          result['rowSet'].each do | row |
            
            visitor_team[:pts_per_game] = row[4]#pointspergame
            visitor_team[:reb_per_game] = row[6]#reboundspergame
            visitor_team[:asst_per_game] = row[8]#assistpergame
            visitor_team[:nba_id] = game[:visit_teamID]
            
          end
        end
      end #ends visit_info loop
      newVisitorTeam = Team.create(visitor_team)
      #game.visitor_team = newVisitorTeam
      createPlayers(game[:visit_teamID])


      home_info['resultSets'].each do | result |
        puts result['name']
        if result['name'] == 'TeamInfoCommon'
          result['rowSet'].each do | row |
            home_team[:city] = row[2]
            home_team[:name] = row[3]#teamname
            home_team[:conference] = row[5]#Conference
            home_team[:rank] = row[11]
            home_team[:wins] = row[8]#wins
            home_team[:losses] = row[9]#losses
          end
        end
        if result['name'] == 'TeamSeasonRanks'
          result['rowSet'].each do | row |
            
            home_team[:pts_per_game] = row[4]#pointspergame
            home_team[:reb_per_game] = row[6]#reboundspergame
            home_team[:asst_per_game] = row[8]#assistpergame
            home_team[:nba_id] = game[:home_teamID]
            
          end
        end
      end #ends visit_info loop
      Team.create(home_team)
      createPlayers(game[:home_teamID])

      




    end #ends games.each
end #ends task







    












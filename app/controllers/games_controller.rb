class GamesController < ApplicationController
  attr_accessor :homeTeamID
  attr_accessor :visitingTeamID
 

  
  #endpoint-game.json
  def gameInfo(date)
    url = "http://data.nba.com/data/5s/json/cms/noseason/scoreboard/#{date}/games.json"
    res = HTTParty.get(url)
    return res
    
  end


  #endpoint-teaminfocommon
  def teamInfoStats(team)#team will be teamID of teams
    res2 = HTTParty.get(
    'http://stats.nba.com/stats/teaminfocommon/',
    { query: { LeagueID: '00', SeasonType: 'Regular Season', TeamID: team, season: '2015-16' }, headers: { "User-Agent" => 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.111 Safari/537.36' }})
    return res2
  end


  #endpoint-teamplayerdashboard
  def teamPlayerStats(team)
    res3 = HTTParty.get(
    'http://stats.nba.com/stats/teamplayerdashboard/',
    { query: { DateFrom: nil, DateTo: nil, GameSegment: nil, LastNGames: '0', LeagueID: '00', Location: nil, MeasureType: 'Base', Month: '0', OpponentTeamID: '0', Outcome: nil, PaceAdjust: 'N', PerMode: 'PerGame', PerGame: nil, Period: '0', PlusMinus: 'N', Rank: 'N', Season: '2015-16', SeasonSegment: nil, SeasonType: 'Regular Season', TeamID: team, VsConference: nil, VsDivision: nil }, headers: { "User-Agent" => 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.111 Safari/537.36' }})
    return res3
  end

  

  def index
    currentDate = DateTime.now.strftime("%Y%m%d")
    @allTeams = [];
    @teamInfo = [];
    res = gameInfo(currentDate)#calling currentDate varable to get tonights game ino
    @allTeams.push(res)
    res2 = teamInfoStats(1610612741)#team id needs to come from gameInfo(home tean vs visiting team)
    @teamInfo.push(res2)
   end

  def show
    @playerInfo = [];#all players from team 
    # @homeTeamID not sure if these need to be here
    # @visitingTeamID
    res3 = teamPlayerStats(1610612741)
    @playerInfo.push(res3)
  end


  def new
  end

  def create
  end


end

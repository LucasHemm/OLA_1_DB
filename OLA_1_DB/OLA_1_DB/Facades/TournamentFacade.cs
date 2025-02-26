using Microsoft.EntityFrameworkCore;
using OLA_1_DB.Entities;


namespace OLA_1_DB.Facades;

public class TournamentFacade
{
    private ApplicationDbContext _context;
    private bool useStoredProcedure;
    
    
    public TournamentFacade(ApplicationDbContext context, IConfiguration configuration)
    {
        _context = context;
        useStoredProcedure = configuration.GetValue<bool>("UseStoredProcedures");
    }
    

    public async Task JoinTournamentAsync(int tournamentId, int playerId)
    {
        if (useStoredProcedure)
        {
            // Use ExecuteSqlInterpolatedAsync to safely pass parameters to the stored procedure.
            await _context.Database.ExecuteSqlInterpolatedAsync(
                $"EXEC joinTournament @tournament_id = {tournamentId}, @player_id = {playerId}");
         return;   
        }
        _context.TournamentRegistrations.Add(CreateTournamentRegistration(tournamentId, playerId));
        _context.SaveChangesAsync();
    }
    
    public async Task SubmitMatchResultAsync(int tournamentId, int player1Id, int player2Id, int winnerId, DateTime matchDate)
    {
        if (useStoredProcedure)
        {
            // Safely execute the stored procedure with the provided parameters using interpolated SQL.
            await _context.Database.ExecuteSqlInterpolatedAsync(
                $"EXEC submitMatchResult @tournament_id = {tournamentId}, @player1_id = {player1Id}, @player2_id = {player2Id}, @winner_id = {winnerId}, @match_date = {matchDate}");
        return;
            
        }
        _context.Matches.Add(CreateMatch(tournamentId, player1Id, player2Id, winnerId, matchDate));
        _context.SaveChangesAsync();
        
    }
        
    
    private TournamentRegistration CreateTournamentRegistration(int tournamentId, int playerId)
    {
        var tournament = _context.Tournaments.Find(tournamentId);
        var player = _context.Players.Find(playerId);
        return new TournamentRegistration
        {
            Tournament_ = tournament,
            Player_ = player,
            Registered_At = DateTime.Now
        };
    }
    
    private Match CreateMatch(int tournamentId, int player1Id, int player2Id, int winnerId, DateTime matchDate)
    {
        var tournament = _context.Tournaments.Find(tournamentId);
        var player1 = _context.Players.Find(player1Id);
        var player2 = _context.Players.Find(player2Id);
        var winner = _context.Players.Find(winnerId);
        return new Match
        {
            Tournament_ = tournament,
            Player1_ = player1,
            Player2_ = player2,
            Winner_ = winner,
            Match_Date = matchDate
        };
    }
}
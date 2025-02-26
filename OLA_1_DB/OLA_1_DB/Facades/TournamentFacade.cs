using Microsoft.EntityFrameworkCore;

namespace OLA_1_DB.Facades;

public class TournamentFacade
{
    private ApplicationDbContext _context;
    
    public TournamentFacade(ApplicationDbContext context)
    {
        _context = context;
    }

    public async Task JoinTournamentAsync(int tournamentId, int playerId)
    {
        // Use ExecuteSqlInterpolatedAsync to safely pass parameters to the stored procedure.
        await _context.Database.ExecuteSqlInterpolatedAsync(
            $"EXEC joinTournament @tournament_id = {tournamentId}, @player_id = {playerId}");
    }
    
    public async Task SubmitMatchResultAsync(int tournamentId, int player1Id, int player2Id, int winnerId, DateTime matchDate)
    {
        // Safely execute the stored procedure with the provided parameters using interpolated SQL.
        await _context.Database.ExecuteSqlInterpolatedAsync(
            $"EXEC submitMatchResult @tournament_id = {tournamentId}, @player1_id = {player1Id}, @player2_id = {player2Id}, @winner_id = {winnerId}, @match_date = {matchDate}");
    }
}